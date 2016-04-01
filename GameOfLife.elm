module GameOfLife where

import GameOfLife.Logic exposing (next)
import GameOfLife.Types exposing (Cells)
import GameOfLife.Patterns exposing (gosperGun, flicker)
import GameOfLife.SvgRenderer exposing (svgRenderer)

import Html exposing (Html)
import Signal exposing (map, foldp)
import Time exposing (fps)

model : Cells
model = flicker

view : Cells -> Html
view = svgRenderer

update : a -> Cells -> Cells
update _ cells = next cells

main : Signal Html
main = map view <| foldp update model (fps 2)
