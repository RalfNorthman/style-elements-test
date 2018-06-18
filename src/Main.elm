module Main exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import List
import String
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
            , Style.Color.background Color.purple
            , Style.Filter.blur 0.18
            ]
        , style RowElement
            [ Shadow.inset
                { offset = ( 3, 5 )
                , size = 2
                , blur = 5
                , color = Color.black
                }
            , Style.Color.background Color.darkPurple
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


createRowElement topPad word =
    el RowElement [ paddingXY 5 0 ] <|
        el RowText [ paddingTop topPad ] <|
            text word


rowElements string pad =
    let
        strings =
            string |> String.words

        pads =
            let
                n =
                    List.length strings
            in
                List.repeat (n // 2 + 1) [ 0, pad ] |> List.concat
    in
        List.map2 createRowElement pads strings


wordsRow string pad =
    row Row [ paddingXY 40 15, spacing 40 ] <|
        rowElements string pad


wholeRow string pad =
    el NoStyle [ center, padding 5 ] <| wordsRow string pad


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
