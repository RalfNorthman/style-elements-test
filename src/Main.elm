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
            [ Border.bottom 2
            , Border.right 2
            , Border.rounded 20
            , Style.Color.border Color.grey
            , Style.Color.background <| Color.greyscale 0.05
            ]
        , style RowElement
            [ Shadow.inset
                { offset = ( 3, 5 )
                , size = 5
                , blur = 20
                , color = Color.darkGrey
                }
            , Style.Color.background Color.lightGrey
            , Border.top 1
            , Border.left 1
            , Border.rounded 5
            , Style.Color.border Color.lightCharcoal
            ]
        , style RowText
            [ Font.typeface [ rowFont ]
            , Font.size 25
            , Font.lineHeight 1.5
            , Style.Color.text Color.white
            , Shadow.text
                { offset = ( 1.5, 2.5 )
                , blur = 1.5
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


createRowElement oddPad word =
    el RowElement [ paddingXY 5 0 ] <|
        full RowText [ paddingTop oddPad ] <|
            text word


rowElements string oddPad =
    let
        stringList =
            string |> String.words

        oddPadList =
            let
                n =
                    List.length stringList
            in
                List.repeat (n // 2 + 1) [ 0, oddPad ] |> List.concat
    in
        List.map2 createRowElement oddPadList stringList


wordsRow string oddPad =
    row Row [ paddingXY 40 15, spacing 40 ] <|
        rowElements string oddPad


wholeRow string oddPad =
    el NoStyle [ center, padding 5 ] <| wordsRow string oddPad


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
