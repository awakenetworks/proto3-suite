{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module TestProtoOneof where
import qualified Prelude as Hs
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Wire as HsProtobuf
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.Applicative as Hs
import qualified Control.Monad as Hs
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.ByteString as Hs
import qualified Data.String as Hs (fromString)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Generics as Hs
import qualified GHC.Enum as Hs
import qualified TestProtoOneofImport
 
data DummyMsg = DummyMsg{dummyMsgDummy :: Hs.Int32}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named DummyMsg where
        nameOf _ = (Hs.fromString "DummyMsg")
 
instance HsProtobuf.Message DummyMsg where
        encodeMessage _ DummyMsg{dummyMsgDummy = dummyMsgDummy}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   dummyMsgDummy)])
        decodeMessage _
          = (Hs.pure DummyMsg) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "dummy")
                []
                Hs.Nothing)]
 
instance HsJSONPB.ToJSONPB DummyMsg where
        toJSONPB (DummyMsg f1) = (HsJSONPB.object ["dummy" .= f1])
        toEncodingPB (DummyMsg f1) = (HsJSONPB.pairs ["dummy" .= f1])
 
instance HsJSONPB.FromJSONPB DummyMsg where
        parseJSONPB
          = (HsJSONPB.withObject "DummyMsg"
               (\ obj -> (Hs.pure DummyMsg) <*> obj .: "dummy"))
 
instance HsJSONPB.ToJSON DummyMsg where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON DummyMsg where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema DummyMsg where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data DummyEnum = DummyEnumDUMMY0
               | DummyEnumDUMMY1
               deriving (Hs.Show, Hs.Bounded, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named DummyEnum where
        nameOf _ = (Hs.fromString "DummyEnum")
 
instance Hs.Enum DummyEnum where
        toEnum 0 = DummyEnumDUMMY0
        toEnum 1 = DummyEnumDUMMY1
        toEnum i = (Hs.toEnumError "DummyEnum" i (0 :: Hs.Int, 1))
        fromEnum (DummyEnumDUMMY0) = 0
        fromEnum (DummyEnumDUMMY1) = 1
        succ (DummyEnumDUMMY0) = DummyEnumDUMMY1
        succ _ = Hs.succError "DummyEnum"
        pred (DummyEnumDUMMY1) = DummyEnumDUMMY0
        pred _ = Hs.predError "DummyEnum"
 
instance HsJSONPB.ToJSONPB DummyEnum where
        toJSONPB x _ = HsJSONPB.enumFieldString x
        toEncodingPB x _ = HsJSONPB.enumFieldEncoding x
 
instance HsJSONPB.FromJSONPB DummyEnum where
        parseJSONPB (HsJSONPB.String "DUMMY0") = Hs.pure DummyEnumDUMMY0
        parseJSONPB (HsJSONPB.String "DUMMY1") = Hs.pure DummyEnumDUMMY1
        parseJSONPB v = (HsJSONPB.typeMismatch "DummyEnum" v)
 
instance HsJSONPB.ToJSON DummyEnum where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON DummyEnum where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsProtobuf.Finite DummyEnum
 
data Something = Something{somethingValue :: Hs.Int64,
                           somethingAnother :: Hs.Int32,
                           somethingPickOne :: Hs.Maybe SomethingPickOne}
               deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Something where
        nameOf _ = (Hs.fromString "Something")
 
instance HsProtobuf.Message Something where
        encodeMessage _
          Something{somethingValue = somethingValue,
                    somethingAnother = somethingAnother,
                    somethingPickOne = somethingPickOne}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.Signed somethingValue)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   (HsProtobuf.Signed somethingAnother)),
                case somethingPickOne of
                    Hs.Nothing -> Hs.mempty
                    Hs.Just x
                      -> case x of
                             SomethingPickOneName y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                                     (HsProtobuf.ForceEmit y))
                             SomethingPickOneSomeid y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 9)
                                     (HsProtobuf.ForceEmit y))
                             SomethingPickOneDummyMsg1 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 10)
                                     (HsProtobuf.Nested (Hs.Just y)))
                             SomethingPickOneDummyMsg2 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 11)
                                     (HsProtobuf.Nested (Hs.Just y)))
                             SomethingPickOneDummyEnum y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 12)
                                     (HsProtobuf.ForceEmit y))])
        decodeMessage _
          = (Hs.pure Something) <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 2)))
              <*>
              (HsProtobuf.oneof Hs.Nothing
                 [((HsProtobuf.FieldNumber 4),
                   (Hs.pure (Hs.Just Hs.. SomethingPickOneName)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 9),
                   (Hs.pure (Hs.Just Hs.. SomethingPickOneSomeid)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 10),
                   (Hs.pure (Hs.fmap SomethingPickOneDummyMsg1)) <*>
                     ((Hs.pure HsProtobuf.nested) <*> HsProtobuf.decodeMessageField)),
                  ((HsProtobuf.FieldNumber 11),
                   (Hs.pure (Hs.fmap SomethingPickOneDummyMsg2)) <*>
                     ((Hs.pure HsProtobuf.nested) <*> HsProtobuf.decodeMessageField)),
                  ((HsProtobuf.FieldNumber 12),
                   (Hs.pure (Hs.Just Hs.. SomethingPickOneDummyEnum)) <*>
                     HsProtobuf.decodeMessageField)])
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.SInt64)
                (HsProtobuf.Single "value")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.SInt32)
                (HsProtobuf.Single "another")
                []
                Hs.Nothing)]
 
instance HsJSONPB.ToJSONPB Something where
        toJSONPB (Something f1 f2 f4_or_f9_or_f10_or_f11_or_f12)
          = (HsJSONPB.object
               ["value" .= f1, "another" .= f2,
                (let encodePickOne
                       = (case f4_or_f9_or_f10_or_f11_or_f12 of
                              Hs.Just (SomethingPickOneName f4) -> (HsJSONPB.pair "name" f4)
                              Hs.Just (SomethingPickOneSomeid f9) -> (HsJSONPB.pair "someid" f9)
                              Hs.Just (SomethingPickOneDummyMsg1 f10)
                                -> (HsJSONPB.pair "dummyMsg1" f10)
                              Hs.Just (SomethingPickOneDummyMsg2 f11)
                                -> (HsJSONPB.pair "dummyMsg2" f11)
                              Hs.Just (SomethingPickOneDummyEnum f12)
                                -> (HsJSONPB.pair "dummyEnum" f12)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("pickOne" .= (HsJSONPB.object [encodePickOne] options)) options
                       else encodePickOne options)])
        toEncodingPB (Something f1 f2 f4_or_f9_or_f10_or_f11_or_f12)
          = (HsJSONPB.pairs
               ["value" .= f1, "another" .= f2,
                (let encodePickOne
                       = (case f4_or_f9_or_f10_or_f11_or_f12 of
                              Hs.Just (SomethingPickOneName f4) -> (HsJSONPB.pair "name" f4)
                              Hs.Just (SomethingPickOneSomeid f9) -> (HsJSONPB.pair "someid" f9)
                              Hs.Just (SomethingPickOneDummyMsg1 f10)
                                -> (HsJSONPB.pair "dummyMsg1" f10)
                              Hs.Just (SomethingPickOneDummyMsg2 f11)
                                -> (HsJSONPB.pair "dummyMsg2" f11)
                              Hs.Just (SomethingPickOneDummyEnum f12)
                                -> (HsJSONPB.pair "dummyEnum" f12)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("pickOne" .= (HsJSONPB.pairs [encodePickOne] options)) options
                       else encodePickOne options)])
 
instance HsJSONPB.FromJSONPB Something where
        parseJSONPB
          = (HsJSONPB.withObject "Something"
               (\ obj ->
                  (Hs.pure Something) <*> obj .: "value" <*> obj .: "another" <*>
                    (let parsePickOne parseObj
                           = Hs.msum
                               [Hs.Just Hs.. SomethingPickOneName <$>
                                  (HsJSONPB.parseField parseObj "name"),
                                Hs.Just Hs.. SomethingPickOneSomeid <$>
                                  (HsJSONPB.parseField parseObj "someid"),
                                Hs.Just Hs.. SomethingPickOneDummyMsg1 <$>
                                  (HsJSONPB.parseField parseObj "dummyMsg1"),
                                Hs.Just Hs.. SomethingPickOneDummyMsg2 <$>
                                  (HsJSONPB.parseField parseObj "dummyMsg2"),
                                Hs.Just Hs.. SomethingPickOneDummyEnum <$>
                                  (HsJSONPB.parseField parseObj "dummyEnum"),
                                Hs.pure Hs.Nothing]
                       in
                       ((obj .: "pickOne") Hs.>>=
                          (HsJSONPB.withObject "pickOne" parsePickOne))
                         <|> (parsePickOne obj))))
 
instance HsJSONPB.ToJSON Something where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON Something where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema Something where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data SomethingPickOne = SomethingPickOneName Hs.Text
                      | SomethingPickOneSomeid Hs.Int32
                      | SomethingPickOneDummyMsg1 TestProtoOneof.DummyMsg
                      | SomethingPickOneDummyMsg2 TestProtoOneof.DummyMsg
                      | SomethingPickOneDummyEnum (HsProtobuf.Enumerated
                                                     TestProtoOneof.DummyEnum)
                      deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named SomethingPickOne where
        nameOf _ = (Hs.fromString "SomethingPickOne")
 
instance HsJSONPB.ToSchema SomethingPickOne where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data OneofFirst = OneofFirst{oneofFirstFirst ::
                             Hs.Maybe OneofFirstFirst,
                             oneofFirstLast :: Hs.Int32}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named OneofFirst where
        nameOf _ = (Hs.fromString "OneofFirst")
 
instance HsProtobuf.Message OneofFirst where
        encodeMessage _
          OneofFirst{oneofFirstFirst = oneofFirstFirst,
                     oneofFirstLast = oneofFirstLast}
          = (Hs.mconcat
               [case oneofFirstFirst of
                    Hs.Nothing -> Hs.mempty
                    Hs.Just x
                      -> case x of
                             OneofFirstFirstChoice1 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                                     (HsProtobuf.ForceEmit y))
                             OneofFirstFirstChoice2 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                                     (HsProtobuf.ForceEmit y)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   oneofFirstLast)])
        decodeMessage _
          = (Hs.pure OneofFirst) <*>
              (HsProtobuf.oneof Hs.Nothing
                 [((HsProtobuf.FieldNumber 1),
                   (Hs.pure (Hs.Just Hs.. OneofFirstFirstChoice1)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 2),
                   (Hs.pure (Hs.Just Hs.. OneofFirstFirstChoice2)) <*>
                     HsProtobuf.decodeMessageField)])
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 3))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "last")
                []
                Hs.Nothing)]
 
instance HsJSONPB.ToJSONPB OneofFirst where
        toJSONPB (OneofFirst f1_or_f2 f3)
          = (HsJSONPB.object
               [(let encodeFirst
                       = (case f1_or_f2 of
                              Hs.Just (OneofFirstFirstChoice1 f1) -> (HsJSONPB.pair "choice1" f1)
                              Hs.Just (OneofFirstFirstChoice2 f2) -> (HsJSONPB.pair "choice2" f2)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("first" .= (HsJSONPB.object [encodeFirst] options)) options else
                       encodeFirst options),
                "last" .= f3])
        toEncodingPB (OneofFirst f1_or_f2 f3)
          = (HsJSONPB.pairs
               [(let encodeFirst
                       = (case f1_or_f2 of
                              Hs.Just (OneofFirstFirstChoice1 f1) -> (HsJSONPB.pair "choice1" f1)
                              Hs.Just (OneofFirstFirstChoice2 f2) -> (HsJSONPB.pair "choice2" f2)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("first" .= (HsJSONPB.pairs [encodeFirst] options)) options else
                       encodeFirst options),
                "last" .= f3])
 
instance HsJSONPB.FromJSONPB OneofFirst where
        parseJSONPB
          = (HsJSONPB.withObject "OneofFirst"
               (\ obj ->
                  (Hs.pure OneofFirst) <*>
                    (let parseFirst parseObj
                           = Hs.msum
                               [Hs.Just Hs.. OneofFirstFirstChoice1 <$>
                                  (HsJSONPB.parseField parseObj "choice1"),
                                Hs.Just Hs.. OneofFirstFirstChoice2 <$>
                                  (HsJSONPB.parseField parseObj "choice2"),
                                Hs.pure Hs.Nothing]
                       in
                       ((obj .: "first") Hs.>>= (HsJSONPB.withObject "first" parseFirst))
                         <|> (parseFirst obj))
                    <*> obj .: "last"))
 
instance HsJSONPB.ToJSON OneofFirst where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON OneofFirst where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema OneofFirst where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data OneofFirstFirst = OneofFirstFirstChoice1 Hs.Text
                     | OneofFirstFirstChoice2 Hs.Text
                     deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named OneofFirstFirst where
        nameOf _ = (Hs.fromString "OneofFirstFirst")
 
instance HsJSONPB.ToSchema OneofFirstFirst where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data OneofMiddle = OneofMiddle{oneofMiddleFirst :: Hs.Int32,
                               oneofMiddleMiddle :: Hs.Maybe OneofMiddleMiddle,
                               oneofMiddleLast :: Hs.Int32}
                 deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named OneofMiddle where
        nameOf _ = (Hs.fromString "OneofMiddle")
 
instance HsProtobuf.Message OneofMiddle where
        encodeMessage _
          OneofMiddle{oneofMiddleFirst = oneofMiddleFirst,
                      oneofMiddleMiddle = oneofMiddleMiddle,
                      oneofMiddleLast = oneofMiddleLast}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   oneofMiddleFirst),
                case oneofMiddleMiddle of
                    Hs.Nothing -> Hs.mempty
                    Hs.Just x
                      -> case x of
                             OneofMiddleMiddleChoice1 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                                     (HsProtobuf.ForceEmit y))
                             OneofMiddleMiddleChoice2 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                                     (HsProtobuf.ForceEmit y)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   oneofMiddleLast)])
        decodeMessage _
          = (Hs.pure OneofMiddle) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.oneof Hs.Nothing
                 [((HsProtobuf.FieldNumber 2),
                   (Hs.pure (Hs.Just Hs.. OneofMiddleMiddleChoice1)) <*>
                     HsProtobuf.decodeMessageField),
                  ((HsProtobuf.FieldNumber 3),
                   (Hs.pure (Hs.Just Hs.. OneofMiddleMiddleChoice2)) <*>
                     HsProtobuf.decodeMessageField)])
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "first")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "last")
                []
                Hs.Nothing)]
 
instance HsJSONPB.ToJSONPB OneofMiddle where
        toJSONPB (OneofMiddle f1 f2_or_f3 f4)
          = (HsJSONPB.object
               ["first" .= f1,
                (let encodeMiddle
                       = (case f2_or_f3 of
                              Hs.Just (OneofMiddleMiddleChoice1 f2)
                                -> (HsJSONPB.pair "choice1" f2)
                              Hs.Just (OneofMiddleMiddleChoice2 f3)
                                -> (HsJSONPB.pair "choice2" f3)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("middle" .= (HsJSONPB.object [encodeMiddle] options)) options else
                       encodeMiddle options),
                "last" .= f4])
        toEncodingPB (OneofMiddle f1 f2_or_f3 f4)
          = (HsJSONPB.pairs
               ["first" .= f1,
                (let encodeMiddle
                       = (case f2_or_f3 of
                              Hs.Just (OneofMiddleMiddleChoice1 f2)
                                -> (HsJSONPB.pair "choice1" f2)
                              Hs.Just (OneofMiddleMiddleChoice2 f3)
                                -> (HsJSONPB.pair "choice2" f3)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("middle" .= (HsJSONPB.pairs [encodeMiddle] options)) options else
                       encodeMiddle options),
                "last" .= f4])
 
instance HsJSONPB.FromJSONPB OneofMiddle where
        parseJSONPB
          = (HsJSONPB.withObject "OneofMiddle"
               (\ obj ->
                  (Hs.pure OneofMiddle) <*> obj .: "first" <*>
                    (let parseMiddle parseObj
                           = Hs.msum
                               [Hs.Just Hs.. OneofMiddleMiddleChoice1 <$>
                                  (HsJSONPB.parseField parseObj "choice1"),
                                Hs.Just Hs.. OneofMiddleMiddleChoice2 <$>
                                  (HsJSONPB.parseField parseObj "choice2"),
                                Hs.pure Hs.Nothing]
                       in
                       ((obj .: "middle") Hs.>>=
                          (HsJSONPB.withObject "middle" parseMiddle))
                         <|> (parseMiddle obj))
                    <*> obj .: "last"))
 
instance HsJSONPB.ToJSON OneofMiddle where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON OneofMiddle where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema OneofMiddle where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data OneofMiddleMiddle = OneofMiddleMiddleChoice1 Hs.Text
                       | OneofMiddleMiddleChoice2 Hs.Text
                       deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named OneofMiddleMiddle where
        nameOf _ = (Hs.fromString "OneofMiddleMiddle")
 
instance HsJSONPB.ToSchema OneofMiddleMiddle where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data WithImported = WithImported{withImportedPickOne ::
                                 Hs.Maybe WithImportedPickOne}
                  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithImported where
        nameOf _ = (Hs.fromString "WithImported")
 
instance HsProtobuf.Message WithImported where
        encodeMessage _
          WithImported{withImportedPickOne = withImportedPickOne}
          = (Hs.mconcat
               [case withImportedPickOne of
                    Hs.Nothing -> Hs.mempty
                    Hs.Just x
                      -> case x of
                             WithImportedPickOneDummyMsg1 y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                                     (HsProtobuf.Nested (Hs.Just y)))
                             WithImportedPickOneWithOneof y
                               -> (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                                     (HsProtobuf.Nested (Hs.Just y)))])
        decodeMessage _
          = (Hs.pure WithImported) <*>
              (HsProtobuf.oneof Hs.Nothing
                 [((HsProtobuf.FieldNumber 1),
                   (Hs.pure (Hs.fmap WithImportedPickOneDummyMsg1)) <*>
                     ((Hs.pure HsProtobuf.nested) <*> HsProtobuf.decodeMessageField)),
                  ((HsProtobuf.FieldNumber 2),
                   (Hs.pure (Hs.fmap WithImportedPickOneWithOneof)) <*>
                     ((Hs.pure HsProtobuf.nested) <*> HsProtobuf.decodeMessageField))])
        dotProto _ = []
 
instance HsJSONPB.ToJSONPB WithImported where
        toJSONPB (WithImported f1_or_f2)
          = (HsJSONPB.object
               [(let encodePickOne
                       = (case f1_or_f2 of
                              Hs.Just (WithImportedPickOneDummyMsg1 f1)
                                -> (HsJSONPB.pair "dummyMsg1" f1)
                              Hs.Just (WithImportedPickOneWithOneof f2)
                                -> (HsJSONPB.pair "withOneof" f2)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("pickOne" .= (HsJSONPB.object [encodePickOne] options)) options
                       else encodePickOne options)])
        toEncodingPB (WithImported f1_or_f2)
          = (HsJSONPB.pairs
               [(let encodePickOne
                       = (case f1_or_f2 of
                              Hs.Just (WithImportedPickOneDummyMsg1 f1)
                                -> (HsJSONPB.pair "dummyMsg1" f1)
                              Hs.Just (WithImportedPickOneWithOneof f2)
                                -> (HsJSONPB.pair "withOneof" f2)
                              Hs.Nothing -> Hs.mempty)
                   in
                   \ options ->
                     if HsJSONPB.optEmitNamedOneof options then
                       ("pickOne" .= (HsJSONPB.pairs [encodePickOne] options)) options
                       else encodePickOne options)])
 
instance HsJSONPB.FromJSONPB WithImported where
        parseJSONPB
          = (HsJSONPB.withObject "WithImported"
               (\ obj ->
                  (Hs.pure WithImported) <*>
                    (let parsePickOne parseObj
                           = Hs.msum
                               [Hs.Just Hs.. WithImportedPickOneDummyMsg1 <$>
                                  (HsJSONPB.parseField parseObj "dummyMsg1"),
                                Hs.Just Hs.. WithImportedPickOneWithOneof <$>
                                  (HsJSONPB.parseField parseObj "withOneof"),
                                Hs.pure Hs.Nothing]
                       in
                       ((obj .: "pickOne") Hs.>>=
                          (HsJSONPB.withObject "pickOne" parsePickOne))
                         <|> (parsePickOne obj))))
 
instance HsJSONPB.ToJSON WithImported where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON WithImported where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema WithImported where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB
 
data WithImportedPickOne = WithImportedPickOneDummyMsg1 TestProtoOneof.DummyMsg
                         | WithImportedPickOneWithOneof TestProtoOneofImport.WithOneof
                         deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithImportedPickOne where
        nameOf _ = (Hs.fromString "WithImportedPickOne")
 
instance HsJSONPB.ToSchema WithImportedPickOne where
        declareNamedSchema = HsJSONPB.genericDeclareNamedSchemaJSONPB