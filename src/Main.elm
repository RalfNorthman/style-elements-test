module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Font as Font
import Style.Shadow as Shadow
import Color


type Styles
    = NoStyle
    | Text


fontImport fontName =
    Font.importUrl
        { url = "https://fonts.googleapis.com/css?family=" ++ fontName
        , name = fontName
        }


myFont =
    fontImport "Tangerine"


stylesheet =
    Style.styleSheet
        [ style NoStyle []
        , style Text
            [ Font.typeface [ myFont ]
            , Font.size 70
            , Shadow.text
                { offset = ( 3, 5 )
                , blur = 2
                , color = Color.lightCharcoal
                }
            ]
        ]



---- VIEW ----


view _ =
    Element.layout stylesheet <|
        el Text
            [ center, padding 30 ]
            (text "The Elm App is working!")



---- PROGRAM ----


main =
    Html.beginnerProgram
        { view = view
        , model = 0
        , update = (\x -> x)
        }
