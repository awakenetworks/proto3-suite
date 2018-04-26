{ mkDerivation, ansi-terminal, ansi-wl-pprint, base
, base16-bytestring, bytestring, case-insensitive, containers
, contravariant, cryptonite, deepseq, directory, exceptions
, filepath, formatting, haskeline, http-client, http-client-tls
, insert-ordered-containers, lens-family-core, memory, mtl
, optparse-generic, parsers, prettyprinter
, prettyprinter-ansi-terminal, repline, scientific, stdenv, tasty
, tasty-hunit, text, transformers, trifecta, unordered-containers
, vector
}:
mkDerivation {
  pname = "dhall";
  version = "1.12.0";
  sha256 = "065cs20v5ps91mygvha5k5348n62vkhacqyv6fdl4m5b2hs0bkab";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    ansi-wl-pprint base base16-bytestring bytestring case-insensitive
    containers contravariant cryptonite directory exceptions filepath
    formatting http-client http-client-tls insert-ordered-containers
    lens-family-core memory parsers prettyprinter
    prettyprinter-ansi-terminal scientific text transformers trifecta
    unordered-containers vector
  ];
  executableHaskellDepends = [
    ansi-terminal base haskeline mtl optparse-generic prettyprinter
    prettyprinter-ansi-terminal repline text trifecta
  ];
  testHaskellDepends = [
    base deepseq insert-ordered-containers prettyprinter tasty
    tasty-hunit text vector
  ];
  description = "A configuration language guaranteed to terminate";
  license = stdenv.lib.licenses.bsd3;
}
