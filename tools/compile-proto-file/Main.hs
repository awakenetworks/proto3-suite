{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE FlexibleInstances   #-}
{-# LANGUAGE LambdaCase          #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}
{-# LANGUAGE TypeOperators       #-}

import           Options.Generic
import           Prelude                        hiding (FilePath)
import           Proto3.Suite.DotProto.Generate
import           Turtle                         (FilePath)

data Args w = Args
  { includeDir :: w ::: [FilePath] <?> "Path to search for included .proto files (can be repeated, and paths will be searched in order; the current directory is used if this option is not provided)"
  , out        :: w ::: FilePath   <?> "Output directory path where generated Haskell modules will be written (directory is created if it does not exist; note that files in the output directory may be overwritten!)"
  , proto      :: w ::: FilePath   <?> "Path to input .proto file"
  } deriving Generic
instance ParseRecord (Args Wrapped)
deriving instance Show (Args Unwrapped)

main :: IO ()
main = do
  Args{..} :: Args Unwrapped <- unwrapRecord "Compiles a .proto file to one or more Haskell modules"
  compileDotProtoFileOrDie includeDir out proto
