module Styles exposing (..)

import Style exposing (..)
import Style.Font as Font
import Style.Shadow as Shadow
import Style.Border as Border
import Style.Color
import Style.Filter
import Color


---- STYLE ----


type MyStyle
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
