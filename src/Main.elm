module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Color
import Color


---- STYLE ----


type Styles
    = NoStyle
    | Title
    | Text
    | Row


stylesheet =
    Style.styleSheet
        [ style NoStyle []
        , style Title
            [ Font.typeface [ fancyFont ]
            , Font.size 70
            , Shadow.text
                { offset = ( 3, 5 )
                , blur = 2
                , color = Color.lightCharcoal
                }
            ]
        , style Text
            [ Font.typeface [ rowFont ]
            , Font.size 25
            ]
        , style Row
            [ Border.all 5
            , Border.rounded 20
            , Style.Color.border Color.lightGrey
            ]
        ]



---- FONTS ---


fontImport fontName =
    Font.importUrl
        { url = "https://fonts.googleapis.com/css?family=" ++ fontName
        , name = fontName
        }


fancyFont =
    fontImport "Tangerine"


rowFont =
    fontImport "Montserrat"



---- VIEW ----


titleElement =
    el Title [ center, padding 10 ] <|
        text "The Fancy Page Title"


wholeRow =
    el NoStyle [ center ] wordsRow


wordsRow =
    row Row
        [ paddingXY 40 15, spacing 40 ]
        [ el Text [] <| text "Separated"
        , el Text [ paddingTop 10 ] <| text "Words"
        , el Text [] <| text "on"
        , el Text [ paddingTop 10 ] <| text "a"
        , el Text [] <| text "Row"
        ]


view model =
    Element.layout stylesheet <|
        column NoStyle
            []
            [ titleElement
            , wholeRow
            ]



---- PROGRAM ----


main =
    Html.beginnerProgram
        { view = view
        , model = 0
        , update = (\x -> x)
        }
