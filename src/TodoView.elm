-- This module has only DOM related code
module TodoView exposing (todoComponent)

import State exposing (..)
import Todo exposing (..)
import StateManager exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (map)

todoListElements: List Todo -> List (Html Msg)
todoListElements todos =
  map todoElement todos

todoElement: Todo -> Html Msg
todoElement todo =
  div[]
    [ input[type_ "checkbox", checked todo.isDone, onClick (Check todo.id)][]
    , label (attributes todo) [text todo.text]
    , button[onClick (Remove todo.id)][text "x"]
    ]

todoFormView: State -> Html Msg
todoFormView model =
  div[]
    [ input[type_ "text", onInput UpdateField, value model.todoField][]
    , button[onClick Add][text "Add"]
    ]

todoComponent: State -> Html Msg
todoComponent model =
  div[]
    [ todoFormView model
    , div[](todoListElements model.todos)
    ]

attributes: Todo -> List (Html.Attribute Msg)
attributes todo =
  if todo.isDone then
    [ style "text-decoration" "line-through"
    , style "color" "red"
    ]
  else
    []
