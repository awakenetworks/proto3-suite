{-# LANGUAGE FlexibleInstances   #-}
{-# LANGUAGE OverloadedLists     #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | Common instances for jsonpb codec implementations

module Proto3.Suite.DotProto.JSONPB.Instances where

import qualified Data.Aeson                         as A (FromJSON (..),
                                                          FromJSONKey (..),
                                                          FromJSONKeyFunction (..),
                                                          ToJSON (..),
                                                          Value (..),
                                                          eitherDecode)
import qualified Data.Aeson.Encoding                as E (pair)
import qualified Data.Aeson.Types                   as A (Parser, Pair, Series, typeMismatch)
import qualified Data.ByteString                    as BS
import qualified Data.ByteString.Base64             as B64
import           Data.Maybe                         (isNothing)
import           Data.Proxy
import qualified Data.Text.Lazy                     as TL
import qualified Data.Text.Lazy.Encoding            as TL
import qualified Data.Text                          as T
import qualified Data.Text.Encoding                 as T
import qualified Data.Vector                        as V
import           GHC.Int                            (Int32, Int64)
import           GHC.Word                           (Word32, Word64)

import           Proto3.Suite.Class                 (HasDefault(..))
import           Proto3.Suite.DotProto.JSONPB.Class (FromJSONPB (..),
                                                     KeyValuePB (..),
                                                     ToJSONPB (..))
import           Proto3.Suite.Types                 (Fixed (..), Nested(..), PackedVec(..), Signed(..))

-- | This instance allows us to use @key .= val@ with the correct jsonpb
-- semantics (default values are omitted via 'mempty) in 'toJSONPB'
-- implementations.
instance KeyValuePB [A.Pair] where
  k .= v
    | isDefault v = mempty
    | otherwise   = [(k, toJSONPB v)]

-- | This instance allows us to use @key .= val@ with the correct jsonpb
-- semantics (default values are omitted via 'mempty') in 'toEncodingPB'
-- implementations.
instance KeyValuePB A.Series where
  k .= v
    | isDefault v = mempty
    | otherwise   = E.pair k (toEncodingPB v)

--------------------------------------------------------------------------------
-- Boolean scalar type

instance ToJSONPB Bool
instance FromJSONPB Bool

--------------------------------------------------------------------------------
-- Integer scalar types
--
--   * 32 bit integer values render to JSON decimal numbers; either numbers or
--     strings are accepted.
--
--   * 64 bit integer values render to JSON decimal strings; either numbers
--     or strings are accepted.
--

-- int32 / sint32
instance ToJSONPB Int32
instance FromJSONPB Int32 where
  parseJSONPB = parseNumOrDecimalString "int32 / sint32"

-- uint32
instance ToJSONPB Word32
instance FromJSONPB Word32 where
  parseJSONPB = parseNumOrDecimalString "uint32"

-- int64 / sint64
instance ToJSONPB Int64 where
  toJSONPB = showDecimalString
instance FromJSONPB Int64 where
  parseJSONPB = parseNumOrDecimalString "int64 / sint64"

-- unit64
instance ToJSONPB Word64 where
  toJSONPB = showDecimalString
instance FromJSONPB Word64 where
  parseJSONPB = parseNumOrDecimalString "int64 / sint64"

-- fixed32
instance ToJSONPB (Fixed Word32) where
  toJSONPB = toJSONPB . fixed
instance FromJSONPB (Fixed Word32) where
  parseJSONPB = fmap Fixed . parseJSONPB

-- fixed64
instance ToJSONPB (Fixed Word64) where
  toJSONPB = toJSONPB . fixed
instance FromJSONPB (Fixed Word64) where
  parseJSONPB = fmap Fixed . parseJSONPB

-- sfixed32
instance ToJSONPB (Fixed Int32) where
  toJSONPB = toJSONPB . fixed
instance FromJSONPB (Fixed Int32) where
  parseJSONPB = fmap Fixed . parseJSONPB

-- sfixed64
instance ToJSONPB (Fixed Int64) where
  toJSONPB = toJSONPB . fixed
instance FromJSONPB (Fixed Int64) where
  parseJSONPB = fmap Fixed . parseJSONPB

--------------------------------------------------------------------------------
-- Floating point scalar types
--
-- JSON value will be a number or one of the special string values "NaN",
-- "Infinity", and "-Infinity". Either numbers or strings are accepted. Exponent
-- notation is also accepted.

-- float
instance ToJSONPB Float
instance FromJSONPB Float where
  parseJSONPB = parseFP "float"

-- double
instance ToJSONPB Double
instance FromJSONPB Double where
  parseJSONPB = parseFP "double"

--------------------------------------------------------------------------------
-- Stringly types (string and bytes)

-- string
instance ToJSONPB TL.Text
instance FromJSONPB TL.Text

-- bytes
instance ToJSONPB BS.ByteString where
  toJSONPB bs = case T.decodeUtf8' (B64.encode bs) of
    Left e  -> error ("internal: failed to encode B64-encoded bytestring: " ++ show e)
               -- T.decodeUtf8' should never fail because we B64-encode the
               -- incoming bytestring.
    Right t -> A.toJSON t
instance FromJSONPB BS.ByteString where
  parseJSONPB (A.String b64enc) = pure . B64.decodeLenient . T.encodeUtf8 $ b64enc
  parseJSONPB v                 = A.typeMismatch "bytes" v

--------------------------------------------------------------------------------
-- Instances for repeated messages
--
-- JSON value will be the vector elements encoded as a JSON array. The null
-- value is accepted as the empty list, @[]@.

instance ToJSONPB a => ToJSONPB (V.Vector a) where
  toJSONPB = A.Array . fmap toJSONPB
instance FromJSONPB a => FromJSONPB (V.Vector a) where
  parseJSONPB (A.Array vs) = mapM parseJSONPB vs
  parseJSONPB A.Null       = pure []
  parseJSONPB v            = A.typeMismatch "repeated" v

--------------------------------------------------------------------------------
-- Instances for nested messages

instance ToJSONPB a => ToJSONPB (Maybe a) where
  toJSONPB = maybe A.Null toJSONPB
instance FromJSONPB a => FromJSONPB (Maybe a) where
  parseJSONPB A.Null = pure Nothing
  parseJSONPB v      = fmap Just (parseJSONPB v)

--------------------------------------------------------------------------------
-- Helpers

parseFP :: (A.FromJSON a, A.FromJSONKey a) => String -> A.Value -> A.Parser a
parseFP tyDesc v = case v of
  A.Number{} -> A.parseJSON v
  A.String t -> case A.fromJSONKey of
                  A.FromJSONKeyTextParser p
                    -> p t
                  _ -> fail "internal: parseKeyPB: unexpected FromJSONKey summand"
  _          -> A.typeMismatch tyDesc v

parseNumOrDecimalString :: (A.FromJSON a) => String -> A.Value -> A.Parser a
parseNumOrDecimalString tyDesc v = case v of
  A.Number{} -> A.parseJSON v
  A.String t -> either fail pure . A.eitherDecode . TL.encodeUtf8 . TL.fromStrict $ t
  _          -> A.typeMismatch tyDesc v

showDecimalString :: Show a => a -> A.Value
showDecimalString = A.String . T.pack . show
