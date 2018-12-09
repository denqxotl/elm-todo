-- Actions for state manager
module TodoActions exposing (..)
import Todo exposing (..)
import State exposing (..)

addTodo: State -> State
addTodo state =
  if String.isEmpty state.todoField then
    state
  else
    let
        todo = Todo state.uid state.todoField False
        todos = todo :: state.todos
    in
        { state
        | todoField = ""
        , uid = state.uid + 1
        , todos = todos }


updateField: State -> String -> State
updateField state todo =
  { state
  | todoField = todo }


check: State -> Int -> State
check state id =
  let
    updateTodo td =
      if td.id == id then
        { td | isDone = not td.isDone }
      else
        td
    newTodos = (List.map updateTodo state.todos)
  in
    { state | todos = newTodos }

remove: State -> Int -> State
remove state id =
  { state
  | todos = List.filter (\t -> t.id /= id) state.todos }
