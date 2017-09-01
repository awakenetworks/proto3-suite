{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module JSONPBTestTypes where
import qualified Prelude as Hs
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import Control.Applicative ((<*>), (<|>))
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.ByteString as Hs
import qualified Data.String as Hs (fromString)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Generics as Hs
import qualified GHC.Enum as Hs
 
data Scalar32 = Scalar32{scalar32I32 :: Hs.Int32,
                         scalar32U32 :: Hs.Word32, scalar32S32 :: Hs.Int32,
                         scalar32F32 :: HsProtobuf.Fixed Hs.Word32,
                         scalar32Sf32 :: HsProtobuf.Fixed Hs.Int32}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Scalar32 where
        nameOf _ = (Hs.fromString "Scalar32")
 
instance HsProtobuf.Message Scalar32 where
        encodeMessage _
          Scalar32{scalar32I32 = scalar32I32, scalar32U32 = scalar32U32,
                   scalar32S32 = scalar32S32, scalar32F32 = scalar32F32,
                   scalar32Sf32 = scalar32Sf32}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   scalar32I32),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   scalar32U32),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (HsProtobuf.Signed scalar32S32)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   scalar32F32),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 5)
                   (HsProtobuf.Signed scalar32Sf32))])
        decodeMessage _
          = (Hs.pure Scalar32) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 5)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "i32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.UInt32)
                (HsProtobuf.Single "u32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.SInt32)
                (HsProtobuf.Single "s32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.Fixed32)
                (HsProtobuf.Single "f32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 5)
                (HsProtobuf.Prim HsProtobuf.SFixed32)
                (HsProtobuf.Single "sf32")
                []
                Hs.Nothing)]
 
data Scalar64 = Scalar64{scalar64I64 :: Hs.Int64,
                         scalar64U64 :: Hs.Word64, scalar64S64 :: Hs.Int64,
                         scalar64F64 :: HsProtobuf.Fixed Hs.Word64,
                         scalar64Sf64 :: HsProtobuf.Fixed Hs.Int64}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Scalar64 where
        nameOf _ = (Hs.fromString "Scalar64")
 
instance HsProtobuf.Message Scalar64 where
        encodeMessage _
          Scalar64{scalar64I64 = scalar64I64, scalar64U64 = scalar64U64,
                   scalar64S64 = scalar64S64, scalar64F64 = scalar64F64,
                   scalar64Sf64 = scalar64Sf64}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   scalar64I64),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   scalar64U64),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (HsProtobuf.Signed scalar64S64)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   scalar64F64),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 5)
                   (HsProtobuf.Signed scalar64Sf64))])
        decodeMessage _
          = (Hs.pure Scalar64) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 5)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int64)
                (HsProtobuf.Single "i64")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.UInt64)
                (HsProtobuf.Single "u64")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.SInt64)
                (HsProtobuf.Single "s64")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.Fixed64)
                (HsProtobuf.Single "f64")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 5)
                (HsProtobuf.Prim HsProtobuf.SFixed64)
                (HsProtobuf.Single "sf64")
                []
                Hs.Nothing)]
 
data ScalarFP = ScalarFP{scalarFPF :: Hs.Float,
                         scalarFPD :: Hs.Double}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named ScalarFP where
        nameOf _ = (Hs.fromString "ScalarFP")
 
instance HsProtobuf.Message ScalarFP where
        encodeMessage _
          ScalarFP{scalarFPF = scalarFPF, scalarFPD = scalarFPD}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   scalarFPF),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   scalarFPD)])
        decodeMessage _
          = (Hs.pure ScalarFP) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Float)
                (HsProtobuf.Single "f")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Double)
                (HsProtobuf.Single "d")
                []
                Hs.Nothing)]
 
data Stringly = Stringly{stringlyStr :: Hs.Text,
                         stringlyBs :: Hs.ByteString}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Stringly where
        nameOf _ = (Hs.fromString "Stringly")
 
instance HsProtobuf.Message Stringly where
        encodeMessage _
          Stringly{stringlyStr = stringlyStr, stringlyBs = stringlyBs}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   stringlyStr),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   stringlyBs)])
        decodeMessage _
          = (Hs.pure Stringly) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "str")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Bytes)
                (HsProtobuf.Single "bs")
                []
                Hs.Nothing)]
 
data Repeat = Repeat{repeatI32s :: Hs.Vector Hs.Int32,
                     repeatI64s :: Hs.Vector Hs.Int64}
            deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Repeat where
        nameOf _ = (Hs.fromString "Repeat")
 
instance HsProtobuf.Message Repeat where
        encodeMessage _
          Repeat{repeatI32s = repeatI32s, repeatI64s = repeatI64s}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.PackedVec repeatI32s)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   (HsProtobuf.PackedVec repeatI64s))])
        decodeMessage _
          = (Hs.pure Repeat) <*>
              ((Hs.pure HsProtobuf.packedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
              <*>
              ((Hs.pure HsProtobuf.packedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 2)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated HsProtobuf.Int32)
                (HsProtobuf.Single "i32s")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Repeated HsProtobuf.Int64)
                (HsProtobuf.Single "i64s")
                []
                Hs.Nothing)]
 
data Nested = Nested{nestedNestedInner ::
                     Hs.Maybe JSONPBTestTypes.Nested_Inner}
            deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Nested where
        nameOf _ = (Hs.fromString "Nested")
 
instance HsProtobuf.Message Nested where
        encodeMessage _ Nested{nestedNestedInner = nestedNestedInner}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.Nested nestedNestedInner))])
        decodeMessage _
          = (Hs.pure Nested) <*>
              ((Hs.pure HsProtobuf.nested) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim (HsProtobuf.Named (HsProtobuf.Single "Inner")))
                (HsProtobuf.Single "nestedInner")
                []
                Hs.Nothing)]
 
data Nested_Inner = Nested_Inner{nested_InnerI64 :: Hs.Int64}
                  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Nested_Inner where
        nameOf _ = (Hs.fromString "Nested_Inner")
 
instance HsProtobuf.Message Nested_Inner where
        encodeMessage _ Nested_Inner{nested_InnerI64 = nested_InnerI64}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   nested_InnerI64)])
        decodeMessage _
          = (Hs.pure Nested_Inner) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int64)
                (HsProtobuf.Single "i64")
                []
                Hs.Nothing)]
 
data Trivial = Trivial{trivialTrivialField :: Hs.Int32}
             deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named Trivial where
        nameOf _ = (Hs.fromString "Trivial")
 
instance HsProtobuf.Message Trivial where
        encodeMessage _ Trivial{trivialTrivialField = trivialTrivialField}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   trivialTrivialField)])
        decodeMessage _
          = (Hs.pure Trivial) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "trivialField")
                []
                Hs.Nothing)]
 
data MultipleFields = MultipleFields{multipleFieldsMultiFieldDouble
                                     :: Hs.Double,
                                     multipleFieldsMultiFieldFloat :: Hs.Float,
                                     multipleFieldsMultiFieldInt32 :: Hs.Int32,
                                     multipleFieldsMultiFieldInt64 :: Hs.Int64,
                                     multipleFieldsMultiFieldString :: Hs.Text,
                                     multipleFieldsMultiFieldBool :: Hs.Bool}
                    deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named MultipleFields where
        nameOf _ = (Hs.fromString "MultipleFields")
 
instance HsProtobuf.Message MultipleFields where
        encodeMessage _
          MultipleFields{multipleFieldsMultiFieldDouble =
                           multipleFieldsMultiFieldDouble,
                         multipleFieldsMultiFieldFloat = multipleFieldsMultiFieldFloat,
                         multipleFieldsMultiFieldInt32 = multipleFieldsMultiFieldInt32,
                         multipleFieldsMultiFieldInt64 = multipleFieldsMultiFieldInt64,
                         multipleFieldsMultiFieldString = multipleFieldsMultiFieldString,
                         multipleFieldsMultiFieldBool = multipleFieldsMultiFieldBool}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   multipleFieldsMultiFieldDouble),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   multipleFieldsMultiFieldFloat),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   multipleFieldsMultiFieldInt32),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   multipleFieldsMultiFieldInt64),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 5)
                   multipleFieldsMultiFieldString),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 6)
                   multipleFieldsMultiFieldBool)])
        decodeMessage _
          = (Hs.pure MultipleFields) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 3))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 4))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 5))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 6))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Double)
                (HsProtobuf.Single "multiFieldDouble")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Float)
                (HsProtobuf.Single "multiFieldFloat")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "multiFieldInt32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Prim HsProtobuf.Int64)
                (HsProtobuf.Single "multiFieldInt64")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 5)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "multiFieldString")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 6)
                (HsProtobuf.Prim HsProtobuf.Bool)
                (HsProtobuf.Single "multiFieldBool")
                []
                Hs.Nothing)]
 
data SignedInts = SignedInts{signedIntsSigned32 :: Hs.Int32,
                             signedIntsSigned64 :: Hs.Int64}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named SignedInts where
        nameOf _ = (Hs.fromString "SignedInts")
 
instance HsProtobuf.Message SignedInts where
        encodeMessage _
          SignedInts{signedIntsSigned32 = signedIntsSigned32,
                     signedIntsSigned64 = signedIntsSigned64}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.Signed signedIntsSigned32)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   (HsProtobuf.Signed signedIntsSigned64))])
        decodeMessage _
          = (Hs.pure SignedInts) <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
              <*>
              ((Hs.pure HsProtobuf.signed) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 2)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.SInt32)
                (HsProtobuf.Single "signed32")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.SInt64)
                (HsProtobuf.Single "signed64")
                []
                Hs.Nothing)]
 
data WithEnum = WithEnum{withEnumEnumField ::
                         HsProtobuf.Enumerated JSONPBTestTypes.WithEnum_TestEnum}
              deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithEnum where
        nameOf _ = (Hs.fromString "WithEnum")
 
instance HsProtobuf.Message WithEnum where
        encodeMessage _ WithEnum{withEnumEnumField = withEnumEnumField}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   withEnumEnumField)])
        decodeMessage _
          = (Hs.pure WithEnum) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim (HsProtobuf.Named (HsProtobuf.Single "TestEnum")))
                (HsProtobuf.Single "enumField")
                []
                Hs.Nothing)]
 
data WithEnum_TestEnum = WithEnum_TestEnumENUM1
                       | WithEnum_TestEnumENUM2
                       | WithEnum_TestEnumENUM3
                       deriving (Hs.Show, Hs.Bounded, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithEnum_TestEnum where
        nameOf _ = (Hs.fromString "WithEnum_TestEnum")
 
instance Hs.Enum WithEnum_TestEnum where
        toEnum 0 = WithEnum_TestEnumENUM1
        toEnum 1 = WithEnum_TestEnumENUM2
        toEnum 2 = WithEnum_TestEnumENUM3
        toEnum i = (Hs.toEnumError "WithEnum_TestEnum" i (0 :: Hs.Int, 2))
        fromEnum (WithEnum_TestEnumENUM1) = 0
        fromEnum (WithEnum_TestEnumENUM2) = 1
        fromEnum (WithEnum_TestEnumENUM3) = 2
        succ (WithEnum_TestEnumENUM1) = WithEnum_TestEnumENUM2
        succ (WithEnum_TestEnumENUM2) = WithEnum_TestEnumENUM3
        succ _ = Hs.succError "WithEnum_TestEnum"
        pred (WithEnum_TestEnumENUM2) = WithEnum_TestEnumENUM1
        pred (WithEnum_TestEnumENUM3) = WithEnum_TestEnumENUM2
        pred _ = Hs.predError "WithEnum_TestEnum"
 
data WithNesting = WithNesting{withNestingNestedMessage ::
                               Hs.Maybe JSONPBTestTypes.WithNesting_Nested}
                 deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithNesting where
        nameOf _ = (Hs.fromString "WithNesting")
 
instance HsProtobuf.Message WithNesting where
        encodeMessage _
          WithNesting{withNestingNestedMessage = withNestingNestedMessage}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.Nested withNestingNestedMessage))])
        decodeMessage _
          = (Hs.pure WithNesting) <*>
              ((Hs.pure HsProtobuf.nested) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim (HsProtobuf.Named (HsProtobuf.Single "Nested")))
                (HsProtobuf.Single "nestedMessage")
                []
                Hs.Nothing)]
 
data WithNesting_Nested = WithNesting_Nested{withNesting_NestedNestedField1
                                             :: Hs.Text,
                                             withNesting_NestedNestedField2 :: Hs.Int32,
                                             withNesting_NestedNestedPacked :: Hs.Vector Hs.Int32,
                                             withNesting_NestedNestedUnpacked :: Hs.Vector Hs.Int32}
                        deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithNesting_Nested where
        nameOf _ = (Hs.fromString "WithNesting_Nested")
 
instance HsProtobuf.Message WithNesting_Nested where
        encodeMessage _
          WithNesting_Nested{withNesting_NestedNestedField1 =
                               withNesting_NestedNestedField1,
                             withNesting_NestedNestedField2 = withNesting_NestedNestedField2,
                             withNesting_NestedNestedPacked = withNesting_NestedNestedPacked,
                             withNesting_NestedNestedUnpacked =
                               withNesting_NestedNestedUnpacked}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   withNesting_NestedNestedField1),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   withNesting_NestedNestedField2),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (HsProtobuf.PackedVec withNesting_NestedNestedPacked)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   (HsProtobuf.UnpackedVec withNesting_NestedNestedUnpacked))])
        decodeMessage _
          = (Hs.pure WithNesting_Nested) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              ((Hs.pure HsProtobuf.packedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
              <*>
              ((Hs.pure HsProtobuf.unpackedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 4)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "nestedField1")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "nestedField2")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Repeated HsProtobuf.Int32)
                (HsProtobuf.Single "nestedPacked")
                [(HsProtobuf.DotProtoOption (HsProtobuf.Single "packed")
                    (HsProtobuf.BoolLit Hs.True))]
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Repeated HsProtobuf.Int32)
                (HsProtobuf.Single "nestedUnpacked")
                [(HsProtobuf.DotProtoOption (HsProtobuf.Single "packed")
                    (HsProtobuf.BoolLit Hs.False))]
                Hs.Nothing)]
 
data WithNestingRepeated = WithNestingRepeated{withNestingRepeatedNestedMessages
                                               ::
                                               Hs.Vector JSONPBTestTypes.WithNestingRepeated_Nested}
                         deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithNestingRepeated where
        nameOf _ = (Hs.fromString "WithNestingRepeated")
 
instance HsProtobuf.Message WithNestingRepeated where
        encodeMessage _
          WithNestingRepeated{withNestingRepeatedNestedMessages =
                                withNestingRepeatedNestedMessages}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.NestedVec withNestingRepeatedNestedMessages))])
        decodeMessage _
          = (Hs.pure WithNestingRepeated) <*>
              ((Hs.pure HsProtobuf.nestedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named (HsProtobuf.Single "Nested")))
                (HsProtobuf.Single "nestedMessages")
                []
                Hs.Nothing)]
 
data WithNestingRepeated_Nested = WithNestingRepeated_Nested{withNestingRepeated_NestedNestedField1
                                                             :: Hs.Text,
                                                             withNestingRepeated_NestedNestedField2
                                                             :: Hs.Int32,
                                                             withNestingRepeated_NestedNestedPacked
                                                             :: Hs.Vector Hs.Int32,
                                                             withNestingRepeated_NestedNestedUnpacked
                                                             :: Hs.Vector Hs.Int32}
                                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithNestingRepeated_Nested where
        nameOf _ = (Hs.fromString "WithNestingRepeated_Nested")
 
instance HsProtobuf.Message WithNestingRepeated_Nested where
        encodeMessage _
          WithNestingRepeated_Nested{withNestingRepeated_NestedNestedField1 =
                                       withNestingRepeated_NestedNestedField1,
                                     withNestingRepeated_NestedNestedField2 =
                                       withNestingRepeated_NestedNestedField2,
                                     withNestingRepeated_NestedNestedPacked =
                                       withNestingRepeated_NestedNestedPacked,
                                     withNestingRepeated_NestedNestedUnpacked =
                                       withNestingRepeated_NestedNestedUnpacked}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   withNestingRepeated_NestedNestedField1),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   withNestingRepeated_NestedNestedField2),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 3)
                   (HsProtobuf.PackedVec withNestingRepeated_NestedNestedPacked)),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 4)
                   (HsProtobuf.UnpackedVec
                      withNestingRepeated_NestedNestedUnpacked))])
        decodeMessage _
          = (Hs.pure WithNestingRepeated_Nested) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
              <*>
              ((Hs.pure HsProtobuf.packedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 3)))
              <*>
              ((Hs.pure HsProtobuf.unpackedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 4)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "nestedField1")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "nestedField2")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 3)
                (HsProtobuf.Repeated HsProtobuf.Int32)
                (HsProtobuf.Single "nestedPacked")
                [(HsProtobuf.DotProtoOption (HsProtobuf.Single "packed")
                    (HsProtobuf.BoolLit Hs.True))]
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 4)
                (HsProtobuf.Repeated HsProtobuf.Int32)
                (HsProtobuf.Single "nestedUnpacked")
                [(HsProtobuf.DotProtoOption (HsProtobuf.Single "packed")
                    (HsProtobuf.BoolLit Hs.False))]
                Hs.Nothing)]
 
data NestedInts = NestedInts{nestedIntsNestedInt1 :: Hs.Int32,
                             nestedIntsNestedInt2 :: Hs.Int32}
                deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named NestedInts where
        nameOf _ = (Hs.fromString "NestedInts")
 
instance HsProtobuf.Message NestedInts where
        encodeMessage _
          NestedInts{nestedIntsNestedInt1 = nestedIntsNestedInt1,
                     nestedIntsNestedInt2 = nestedIntsNestedInt2}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   nestedIntsNestedInt1),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   nestedIntsNestedInt2)])
        decodeMessage _
          = (Hs.pure NestedInts) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "nestedInt1")
                []
                Hs.Nothing),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "nestedInt2")
                []
                Hs.Nothing)]
 
data WithNestingRepeatedInts = WithNestingRepeatedInts{withNestingRepeatedIntsNestedInts
                                                       :: Hs.Vector JSONPBTestTypes.NestedInts}
                             deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance HsProtobuf.Named WithNestingRepeatedInts where
        nameOf _ = (Hs.fromString "WithNestingRepeatedInts")
 
instance HsProtobuf.Message WithNestingRepeatedInts where
        encodeMessage _
          WithNestingRepeatedInts{withNestingRepeatedIntsNestedInts =
                                    withNestingRepeatedIntsNestedInts}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   (HsProtobuf.NestedVec withNestingRepeatedIntsNestedInts))])
        decodeMessage _
          = (Hs.pure WithNestingRepeatedInts) <*>
              ((Hs.pure HsProtobuf.nestedvec) <*>
                 (HsProtobuf.at HsProtobuf.decodeMessageField
                    (HsProtobuf.FieldNumber 1)))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Repeated
                   (HsProtobuf.Named (HsProtobuf.Single "NestedInts")))
                (HsProtobuf.Single "nestedInts")
                []
                Hs.Nothing)]