-- Idk why I decide to move it to another file
module Todo exposing (..)

type alias Todo =
  { id: Int
  , text : String
  , isDone: Bool
  }
