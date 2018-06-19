module RowElement exposing (wholeRow)

import Element exposing (..)
import Element.Attributes exposing (..)
import List
import String
import Styles exposing (..)


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
