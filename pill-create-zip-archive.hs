#! /usr/bin/env nix-shell
#! nix-shell -i cabal -p haskell.compiler.ghc902 haskellPackages.cabal-install zlib bzip2
{- cabal:
build-depends: base
             , bytestring
             , zip
-}
{-# LANGUAGE OverloadedStrings #-}

import qualified Codec.Archive.Zip as Zip
import Control.Monad.IO.Class
import qualified Data.ByteString as B
import System.Environment (getArgs)


main :: IO ()
main = do
  [path] <- getArgs
  buildZip path [("a.txt", "A"), ("b.txt", "B"), ("c.txt", "C")]


buildZip ::
  MonadIO m =>
  FilePath ->
  [(FilePath, B.ByteString)] ->
  m ()
buildZip p = Zip.createArchive p . mapM_ (\(n, c) -> Zip.addEntry Zip.Store c =<< Zip.mkEntrySelector n)
