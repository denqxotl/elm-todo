module State exposing (..)

import Todo exposing (..)

-- `todoField` -- value for Todo Input Field
-- `todos` -- list of Todos.
-- `uid` -- set initial id for todo.
-- -- When u create todo this value gonna to be incremented

type alias State =
  { todoField: String
  , todos: List Todo
  , uid: Int
  }
