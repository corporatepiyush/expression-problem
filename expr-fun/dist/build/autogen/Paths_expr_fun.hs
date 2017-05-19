{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_expr_fun (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ahampiyush/Library/Haskell/bin"
libdir     = "/Users/ahampiyush/Library/Haskell/ghc-8.0.2-x86_64/lib/expr-fun-1.0"
dynlibdir  = "/Users/ahampiyush/Library/Haskell/ghc-8.0.2-x86_64/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/ahampiyush/Library/Haskell/share/ghc-8.0.2-x86_64/expr-fun-1.0"
libexecdir = "/Users/ahampiyush/Library/Haskell/libexec"
sysconfdir = "/Users/ahampiyush/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "expr_fun_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "expr_fun_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "expr_fun_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "expr_fun_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "expr_fun_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "expr_fun_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
