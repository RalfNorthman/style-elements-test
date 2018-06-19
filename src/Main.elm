module Main exposing (..)

import Html
import List
import Element exposing (..)
import Element.Attributes exposing (..)
import Styles exposing (..)
import RowElement exposing (..)


---- VIEW ----


titleElement =
    el Title [ center, padding 10 ] <|
        text "The Fancy Page Title"


rowSentences =
    [ "Separated Words on a Row"
    , "Something else in a similar style"
    , "a b c d e f g h i j k"
    ]


oddPads =
    [ 10, 25, 45 ]


rowsThing =
    List.map2 wholeRow rowSentences oddPads


view model =
    Element.layout stylesheet <|
        column NoStyle [] <|
            titleElement
                :: rowsThing



---- PROGRAM ----


main =
    Html.beginnerProgram
        { view = view
        , model = 0
        , update = (\x -> x)
        }
