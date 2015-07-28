module GameOfLife where

import GameOfLife.Logic exposing (next)
import GameOfLife.Types exposing (Cell, Cells)
import GameOfLife.Patterns exposing (gosperGun)
import GameOfLife.SvgRenderer exposing (svgRenderer)

import Html exposing (Html)
import Signal exposing (Signal)
import Time exposing (fps)

initialCells : Cells
initialCells = gosperGun

view : Cells -> Html
view = svgRenderer

tick : a -> Cells -> Cells
tick _ currentCells = next currentCells

latestCells : Signal Cells
latestCells = Signal.foldp tick initialCells (fps 60)

main : Signal Html
main = Signal.map view latestCells
