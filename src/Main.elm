module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (..)
import RowElement exposing (..)


---- VIEW ----


titleElement =
    el Title [ center, padding 10 ] <|
        text "The Fancy Page Title"


rowSentence1 =
    "Separated Words on a Row"


rowSentence2 =
    "Something else in a similar style"


view model =
    Element.layout stylesheet <|
        column NoStyle
            []
            [ titleElement
            , wholeRow rowSentence1 10
            , wholeRow rowSentence2 25
            ]



---- PROGRAM ----


main =
    Html.beginnerProgram
        { view = view
        , model = 0
        , update = (\x -> x)
        }
