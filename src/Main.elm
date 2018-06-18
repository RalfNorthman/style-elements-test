module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Color
import Style.Filter
import Color


---- STYLE ----


type Styles
    = NoStyle
    | Title
    | Text
    | Row
    | RowElement


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
            , Style.Color.text Color.lightYellow
            , Shadow.text
                { offset = ( 1.5, 2.5 )
                , blur = 1
                , color = Color.black
                }
            ]
        , style Row
            [ Border.all 2
            , Border.rounded 20
            , Style.Color.border Color.black
            , Style.Color.background Color.darkPurple
            , Style.Filter.blur 0.18
            ]
        , style RowElement
            [ Shadow.inset
                { offset = ( 3, 5 )
                , size = 2
                , blur = 5
                , color = Color.black
                }
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


rowElement topPad word =
    el RowElement [ paddingXY 10 0 ] <|
        el Text [ paddingTop topPad ] <|
            text word


wordsRow =
    row Row
        [ paddingXY 40 15, spacing 40 ]
        [ rowElement 0 "Separated"
        , rowElement 10 "Words"
        , rowElement 0 "on"
        , rowElement 10 "a"
        , rowElement 0 "Row"
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
