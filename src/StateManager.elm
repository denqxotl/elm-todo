-- State manager allows to operate application state.
module StateManager exposing (..)
import TodoActions exposing (..)
import Todo exposing (..)
import State exposing (..)

type Msg
  = Add
  | UpdateField String
  | Check Int
  | Remove Int

update: Msg -> State -> State
update msg state =
  case msg of
    Add -> addTodo state
    UpdateField todo -> updateField state todo
    Check id -> check state id
    Remove id -> remove state id

initState: State
initState =
  State "" [] 1
