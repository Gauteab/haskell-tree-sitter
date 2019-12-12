{-# LANGUAGE TemplateHaskell #-}
module Main
( main
) where

import Language.Haskell.TH
import TreeSitter.GenerateSyntax
import TreeSitter.JSON.Internal
import TreeSitter.JSON.AST.Internal

main :: IO ()
main = do
  let jsonPath = "vendor/tree-sitter-json/src/node-types.json"
  ast <- runQ (astDeclarationsForLanguage tree_sitter_json [''StringContent] jsonPath)
  putStrLn (pprint ast)
