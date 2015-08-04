module GameOfLife.SvgRenderer (svgRenderer) where

import GameOfLife.Types exposing (Cell, Cells)

import Html exposing (Html)
import Svg exposing (svg, rect)
import Svg.Attributes exposing (..)

svgRenderer : Cells -> Html
svgRenderer cells =
  svg [ version "1.1", viewBox "0 0 800 1800" ]
    (List.map renderCell cells)

renderCell : Cell -> Html
renderCell (cx, cy) =
  rect [ fill "#000"
       , x (toString (cx * 20))
       , y (toString (cy * 20))
       , width "19"
       , height "19"] []
