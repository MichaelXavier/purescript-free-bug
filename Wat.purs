module Wat where

import Control.Monad.Eff
import Control.Monad.Free
import Data.Coyoneda
import Debug.Trace

data ExampleF a = Log String a

type Example a = FreeC ExampleF a

log :: String -> Example Unit
log s = liftFC $ Log s unit

exampleN :: forall e. Natural ExampleF (Eff (trace :: Trace))
exampleN (Log s a) = const a <$> trace s

run :: forall a. Example a -> Eff (trace :: Trace) a
run = goEffC exampleN

hello = log "hi"

letsago = run hello
