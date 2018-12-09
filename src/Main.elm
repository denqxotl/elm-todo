-- The heart of application. ENTRY POINT
module Main exposing (main)

import Browser exposing (sandbox)
import TodoView exposing (todoComponent)
import StateManager exposing (initState, update)

main =
  sandbox
    { init = initState
    , update = update
    , view = todoComponent
    }
