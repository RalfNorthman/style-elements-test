module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (map2)
import String exposing (words)
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
    | Row
    | RowElement
    | RowText


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
            , Border.rounded 5
            ]
        , style RowText
            [ Font.typeface [ rowFont ]
            , Font.size 25
            , Style.Color.text Color.lightYellow
            , Shadow.text
                { offset = ( 1.5, 2.5 )
                , blur = 1
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


rowElement topPad word =
    el RowElement [ paddingXY 10 0 ] <|
        el RowText [ paddingTop topPad ] <|
            text word


topPads =
    [ 0, 10, 0, 10, 0 ]


rowWords =
    "Separated Words on a Row" |> words


wordsRow =
    row Row [ paddingXY 40 15, spacing 40 ] <|
        map2 rowElement topPads rowWords


wholeRow =
    el NoStyle [ center ] wordsRow


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
