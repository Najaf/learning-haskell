A simple library for rendering SimpleJSON to strings

日本語でコメントをします。

> module PutJSON where
> import Data.List (intercalate)
> import SimpleJSON

This module imports the single function renderJValue which does exact what it
sounds like:

> renderJValue :: JValue ->

