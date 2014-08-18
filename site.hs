{-# LANGUAGE OverloadedStrings #-}

import Hakyll


copy pattern = match pattern $ do
    route idRoute
    compile copyFileCompiler

createGPGKey key = create [(fromFilePath ("keys/" ++ key ++ ".asc"))] $ do
    route idRoute
    compile $ makeItem ""  >>= withItemBody (unixFilter "gpg" ["--export", "--armor", key])

main :: IO ()
main = hakyll $ do
    copy "css/*"
    createGPGKey "37BFBEFA"
    match "_templates/*" $ do
        compile templateCompiler
    match "*.md" $ do
        route $ setExtension "html"
        compile $
            pandocCompiler >>= loadAndApplyTemplate "_templates/default.html" defaultContext >>= relativizeUrls
