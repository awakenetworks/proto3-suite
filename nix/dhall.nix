{ mkDerivation, ansi-terminal, base, bytestring, case-insensitive
, containers, contravariant, criterion, cryptonite, deepseq, Diff
, directory, doctest, exceptions, filepath, haskeline, http-client
, http-client-tls, insert-ordered-containers, lens-family-core
, megaparsec, memory, mockery, mtl, optparse-applicative, parsers
, prettyprinter, prettyprinter-ansi-terminal, repline, scientific
, stdenv, tasty, tasty-hunit, template-haskell, text, transformers
, unordered-containers, vector
}:
mkDerivation {
  pname = "dhall";
  version = "1.15.1";
  sha256 = "ea3bb3b6a006b82e0286d72757ba9969f6ee292ef12eea2376939ba219c88e30";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    ansi-terminal base bytestring case-insensitive containers
    contravariant cryptonite Diff directory exceptions filepath
    haskeline http-client http-client-tls insert-ordered-containers
    lens-family-core megaparsec memory mtl optparse-applicative parsers
    prettyprinter prettyprinter-ansi-terminal repline scientific
    template-haskell text transformers unordered-containers vector
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base deepseq directory doctest filepath insert-ordered-containers
    mockery prettyprinter tasty tasty-hunit text vector
  ];
  benchmarkHaskellDepends = [
    base containers criterion directory text
  ];
  description = "A configuration language guaranteed to terminate";
  license = stdenv.lib.licenses.bsd3;
}
