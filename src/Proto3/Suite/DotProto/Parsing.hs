-- | This module contains a near-direct translation of the proto3 grammar
--   It uses String for easier compatibility with DotProto.Generator, which needs it for not very good reasons

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections     #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# OPTIONS_GHC -fno-warn-unused-do-bind #-}

module Proto3.Suite.DotProto.Parsing
  ( parseProto
  , parseProtoFile
  ) where

import Control.Applicative hiding (empty)
import Control.Monad
import Data.Functor
import qualified Data.Text as T
import qualified Filesystem.Path.CurrentOS as FP
import Proto3.Suite.DotProto.AST
import Proto3.Wire.Types (FieldNumber(..))
import Text.Parsec (parse, ParseError)
import Text.Parsec.String (Parser)
import Text.Parser.Char
import Text.Parser.Combinators
import Text.Parser.LookAhead
import Text.Parser.Token
import qualified Text.Parser.Token.Style as TokenStyle

-- import qualified Text.Parsec.Token    as Lexer
-- import qualified Text.Parsec.Language as Lexer (javaStyle)
import qualified Turtle

-- | Wrapper around @Text.Parsec.String.Parser@, overriding whitespace lexing.
newtype ProtoParser a = ProtoParser { runProtoParser :: Parser a }
  deriving ( Functor, Applicative, Alternative, Monad, MonadPlus
           , Parsing, CharParsing, LookAheadParsing)

instance TokenParsing ProtoParser where
  someSpace = TokenStyle.buildSomeSpaceParser (ProtoParser someSpace)
                                              TokenStyle.javaCommentStyle
  nesting     = ProtoParser . nesting . runProtoParser
  semi        = ProtoParser semi
  highlight h = ProtoParser . highlight h . runProtoParser
  token       = ProtoParser . token . runProtoParser

-- -- Tokenizer
-- lexer = Lexer.makeTokenParser Lexer.javaStyle
-- parens = Lexer.parens lexer
-- whiteSpace = Lexer.whiteSpace lexer
-- semiSep = Lexer.semiSep lexer
-- semiSep1 = Lexer.semiSep1 lexer

----------------------------------------
-- interfaces

-- | @parseProto mp inp@ attempts to parse @inp@ as a 'DotProto'. @mp@ is the
-- module path to be injected into the AST as part of 'DotProtoMeta' metadata on
-- a successful parse.
parseProto :: Path -> String -> Either ParseError DotProto
parseProto modulePath = parse (runProtoParser (topLevel modulePath)) "" -- . stripComments

-- | @parseProtoFile mp fp@ reads and parses the .proto file found at @fp@. @mp@
-- is used downstream during code generation when we need to generate names
-- which are a function of the source .proto file's filename and its path
-- relative to some @--includeDir@.
parseProtoFile :: Turtle.MonadIO m
               => Path -> Turtle.FilePath -> m (Either ParseError DotProto)
parseProtoFile modulePath =
  fmap (parseProto modulePath) . Turtle.liftIO . readFile . FP.encodeString

----------------------------------------
-- convenience

listSep :: ProtoParser ()
listSep = textSymbol "," --  whiteSpace >> text "," >> whiteSpace

empty :: ProtoParser ()
empty = textSymbol ";"  -- whiteSpace >> text ";" >> return ()

nonEmptyList :: ProtoParser a -> ProtoParser [a]
nonEmptyList one = one `sepBy1` listSep

fieldNumber :: ProtoParser FieldNumber
fieldNumber = FieldNumber . fromInteger <$> integer

-- [issue] this is a terrible, naive way to strip comments
--         any string that contains "//" breaks
--         a regex would be better, but the best thing to do is to just replace all the string logic with a lexer
-- _stripComments :: String -> String
-- _stripComments ('/':'/':rest) = _stripComments (dropWhile (/= '\n') rest)
-- _stripComments (x:rest)       = x:_stripComments rest
-- _stripComments []             = []

-- [issue] This is still a terrible and naive way to strip comments, was written
-- hastily, and has been only lightly tested. However, it improves upon
-- `_stripComments` above: it handles /* block comments /* with nesting */ */,
-- "// string lits with comments in them", etc., and thus is closer to the
-- protobuf3 grammar. The right solution is still to replace this with a proper
-- lexer, but since we might switch to using the `protoc`-based `FileDescriptor`
-- parsing instead, we should hold off. If we do decide to stick with this
-- parser, we should also inject comments into the AST so that they can be
-- marshaled into the generated code, and ensure that line numbers reported in
-- errors are still correct. Although this implementation is handy to toss out
-- in the interests of getting some more .protos parsable, it's probably not
-- worth maintaining, and has an ad-hoc smell. If we find ourselves mucking with
-- this much at all in the nvery near short term, let's just pay the freight and
-- use `Text.Parsec.Token` or somesuch.
-- data StripCommentState
--        --               | starts  | ends | error on?       |
--   = BC -- block comment | "/*"    | "*/" | mismatch        |
--   | DQ -- double quote  | '"'     | '"'  | mismatch        |
--   | LC -- line comment  | "//"    | '\n' | mismatch ('\n') |
--   deriving Show

-- stripComments :: String -> String
-- stripComments = go [] where
--   go []        ('/':'*':cs) = go [BC] cs
--   go st@(BC:_) ('/':'*':cs) = go (BC:st) cs
--   go []        ('*':'/':_)  = error "*/ without preceding /*"
--   go (BC:st)   ('*':'/':cs) = go st cs
--   go st@(BC:_) (_:cs)       = go st cs
--   go []        ('/':'/':cs) = go [LC] cs
--   go []        ('"':cs)     = '"' : go [DQ] cs
--   go (LC:st)   cs@('\n':_)  = go st cs
--   go st@(LC:_) (_:cs)       = go st cs
--   go (DQ:st)   ('"':cs)     = '"' : go st cs
--   go st        (c:cs)       = c : go st cs
--   go []        []           = []
--   go (BC:_)    []           = error "unterminated block comment"
--   go (DQ:_)    []           = error "unterminated double-quote"
--   go (LC:_)    []           = error "unterminated line comment (missing newline)"

----------------------------------------
-- identifiers

identifierName :: ProtoParser String
identifierName = do h <- letter
                    t <- many (alphaNum <|> char '_')
                    return $ h:t

identifier :: ProtoParser DotProtoIdentifier
identifier = do is <- identifierName `sepBy1` string "."
                return $ case is of
                  [i] -> Single i
                  _   -> Dots (Path is)

-- [note] message and enum types are defined by the proto3 spec to have an optional leading period (messageType and enumType in the spec)
--        what this indicates is, as far as i can tell, not documented, and i haven't found this syntax used in practice
--        it's ommitted but can be fairly easily added if there is in fact a use for it

-- [update] the leading dot denotes that the identifier path starts in global scope
--          i still haven't seen a use case for this but i can add it upon request

nestedIdentifier :: ProtoParser DotProtoIdentifier
nestedIdentifier = do h <- parens identifier
                      string "."
                      t <- identifier
                      return $ Qualified h t

----------------------------------------
-- values

-- [issue] these string parsers are weak to \" and \000 octal codes
stringLit :: ProtoParser String
stringLit = stringLiteral <|> stringLiteral'

bool :: ProtoParser Bool
bool = (string "true"  >> (notFollowedBy $ alphaNum <|> char '_') $> True) -- used to distinguish "true_" (Identifier) from "true" (BoolLit)
   <|> (string "false" >> (notFollowedBy $ alphaNum <|> char '_') $> False)

-- the `parsers` package actually does not expose a parser for signed fractional values
floatLit :: ProtoParser Double
floatLit = do sign <- char '-' $> negate <|> char '+' $> id <|> pure id
              sign <$> double

value :: ProtoParser DotProtoValue
value = try (BoolLit              <$> bool)
    <|> try (StringLit            <$> stringLit)
    <|> try (FloatLit             <$> floatLit)
    <|> try (IntLit . fromInteger <$> integer)
    <|> try (Identifier           <$> identifier)

----------------------------------------
-- types

primType :: ProtoParser DotProtoPrimType
primType = try (string "double"   $> Double)
       <|> try (string "float"    $> Float)
       <|> try (string "int32"    $> Int32)
       <|> try (string "int64"    $> Int64)
       <|> try (string "sint32"   $> SInt32)
       <|> try (string "sint64"   $> SInt64)
       <|> try (string "uint32"   $> UInt32)
       <|> try (string "uint64"   $> UInt64)
       <|> try (string "fixed32"  $> Fixed32)
       <|> try (string "fixed64"  $> Fixed64)
       <|> try (string "sfixed32" $> SFixed32)
       <|> try (string "sfixed64" $> SFixed64)
       <|> try (string "string"   $> String)
       <|> try (string "bytes"    $> Bytes)
       <|> try (string "bool"     $> Bool)
       <|> Named <$> identifier

--------------------------------------------------------------------------------
-- top-level parser and version annotation

syntaxSpec :: ProtoParser ()
syntaxSpec = do string "syntax"
                string "="
                string "'proto3'" <|> string "\"proto3\""
                string ";"

data DotProtoStatement
  = DPSOption     DotProtoOption
  | DPSPackage    DotProtoPackageSpec
  | DPSImport     DotProtoImport
  | DPSDefinition DotProtoDefinition
  | DPSEmpty
  deriving Show

sortStatements :: Path -> [DotProtoStatement] -> DotProto
sortStatements modulePath statements
  = DotProto { protoOptions     =       [ x | DPSOption     x <- statements]
             , protoImports     =       [ x | DPSImport     x <- statements]
             , protoPackage     = adapt [ x | DPSPackage    x <- statements]
             , protoDefinitions =       [ x | DPSDefinition x <- statements]
             , protoMeta        = DotProtoMeta modulePath
             }
  where
    adapt (x:_) = x
    adapt _     = DotProtoNoPackage

topLevel :: Path -> ProtoParser DotProto
topLevel modulePath = do syntaxSpec
                         sortStatements modulePath <$> many topStatement

--------------------------------------------------------------------------------
-- top-level statements

topStatement :: ProtoParser DotProtoStatement
topStatement = (DPSImport     <$> import_)
           <|> (DPSPackage    <$> package)
           <|> (DPSOption     <$> topOption)
           <|> (DPSDefinition <$> definition)
           <|> empty $> DPSEmpty

import_ :: ProtoParser DotProtoImport
import_ = do string "import"
             qualifier <- option DotProtoImportDefault $
                                 string "weak" $> DotProtoImportWeak
                             <|> string "public" $> DotProtoImportPublic
             target <- FP.fromText . T.pack <$> stringLit
             string ";"
             return $ DotProtoImport qualifier target

package :: ProtoParser DotProtoPackageSpec
package = do string "package"
             p <- identifier
             string ";"
             return $ DotProtoPackageSpec p

definition :: ProtoParser DotProtoDefinition
definition = message
         <|> enum
         <|> service

--------------------------------------------------------------------------------
-- options

-- optionName :: ProtoParser DotProtoIdentifier
-- optionName = do ohead <- nestedIdentifier <|> identifier -- this permits the (p.p2).p3 option identifier form
--                                                          -- i'm not actually sure if this form is used in non-option statements
--                 string "="
--                 return ohead

-- optionValue :: ProtoParser DotProtoValue
-- optionValue = value

inlineOption :: ProtoParser DotProtoOption
inlineOption = DotProtoOption <$> (optionName <* string "=") <*> value
  where
    optionName = nestedIdentifier <|> identifier

optionAnnotation :: ProtoParser [DotProtoOption]
optionAnnotation = brackets (nonEmptyList inlineOption) <|> pure []

topOption :: ProtoParser DotProtoOption
topOption = string "option" *> inlineOption <* string ";"

--------------------------------------------------------------------------------
-- service statements

servicePart :: ProtoParser DotProtoServicePart
servicePart = rpc
          <|> (DotProtoServiceOption <$> topOption)
          <|> empty $> DotProtoServiceEmpty

rpcOptions :: ProtoParser [DotProtoOption]
rpcOptions = braces $ many topOption

rpcClause :: ProtoParser (DotProtoIdentifier, Streaming)
rpcClause = do
  let sid ctx = (,ctx) <$> identifier
  -- NB: Distinguish "stream stream.foo" from "stream.foo"
  try (symbol "stream" *> sid Streaming) <|> sid NonStreaming

rpc :: ProtoParser DotProtoServicePart
rpc = do symbol "rpc"
         name <- Single <$> identifierName
         subjecttype <- parens rpcClause
         symbol "returns"
         returntype <- parens rpcClause
         options <- rpcOptions <|> (symbol ";" $> [])
         return $ DotProtoServiceRPC name subjecttype returntype options

service :: ProtoParser DotProtoDefinition
service = do symbol "service"
             name <- Single <$> identifierName
             statements <- braces (many servicePart)
             return $ DotProtoService name statements

--------------------------------------------------------------------------------
-- message definitions

message :: ProtoParser DotProtoDefinition
message = do symbol "message"
             name <- Single <$> identifierName
             body <- braces (many messagePart)
             return $ DotProtoMessage name body

messagePart :: ProtoParser DotProtoMessagePart
messagePart = try (DotProtoMessageDefinition <$> enum)
          <|> try (DotProtoMessageReserved   <$> reservedField)
          <|> try (DotProtoMessageDefinition <$> message)
          <|> try messageOneOf
          <|> try (DotProtoMessageField      <$> messageMapField)
          <|>     (DotProtoMessageField      <$> messageField)

messageField :: ProtoParser DotProtoField
messageField = do ctor <- (try $ symbol "repeated" $> Repeated) <|> pure Prim
                  mtype <- primType
                  mname <- identifier
                  symbol "="
                  mnumber <- fieldNumber
                  moptions <- optionAnnotation
                  symbol ";"
                  -- TODO: parse comments
                  return $ DotProtoField mnumber (ctor mtype) mname moptions Nothing

messageMapField :: ProtoParser DotProtoField
messageMapField = do symbol "map"
                     symbol "<"
                     ktype <- primType
                     symbol ","
                     vtype <- primType
                     symbol ">"
                     mname <- identifier
                     symbol "="
                     fpos <- fieldNumber
                     fos <- optionAnnotation
                     symbol ";"
                     -- TODO: parse comments
                     return $ DotProtoField fpos (Map ktype vtype) mname fos Nothing

--------------------------------------------------------------------------------
-- enumerations

enumField :: ProtoParser DotProtoEnumPart
enumField = do fname <- identifier
               symbol "="
               fpos <- fromInteger <$> integer
               opts <- optionAnnotation
               symbol ";"
               return $ DotProtoEnumField fname fpos opts


enumStatement :: ProtoParser DotProtoEnumPart
enumStatement = try (DotProtoEnumOption <$> topOption)
            <|> enumField
            <|> empty $> DotProtoEnumEmpty

enum :: ProtoParser DotProtoDefinition
enum = do symbol "enum"
          ename <- Single <$> identifierName
          ebody <- braces (many enumStatement)
          return $ DotProtoEnum ename ebody

--------------------------------------------------------------------------------
-- oneOf

oneOfField :: ProtoParser DotProtoField
oneOfField = do ftype <- Prim <$> primType
                fname <- identifier
                symbol "="
                fpos <- fromInteger <$> integer
                fops <- optionAnnotation
                symbol ";"
                -- TODO: parse comments
                return $ DotProtoField fpos ftype fname fops Nothing

messageOneOf :: ProtoParser DotProtoMessagePart
messageOneOf = do symbol "oneof"
                  name <- identifier
                  body <- braces $ many (oneOfField <|> empty $> DotProtoEmptyField)
                  return $ DotProtoMessageOneOf name body

--------------------------------------------------------------------------------
-- field reservations

range :: ProtoParser DotProtoReservedField
range = do lookAhead (integer >> symbol "to") -- [note] parsec commits to this parser too early without this lookahead
           s <- fromInteger <$> integer
           symbol "to"
           e <- fromInteger <$> integer
           return $ FieldRange s e

ranges :: ProtoParser [DotProtoReservedField]
ranges = nonEmptyList (try range <|> (SingleField . fromInteger <$> integer))

reservedField :: ProtoParser [DotProtoReservedField]
reservedField = do symbol "reserved"
                   v <- ranges <|> nonEmptyList (ReservedIdentifier <$> stringLit)
                   symbol ";"
                   return v
