module GameOfLife.Logic (next) where

import List exposing (filter, length, member, head, tail)
import GameOfLife.Types exposing (Cell, Cells)

next : Cells -> Cells
next livingCells =
  (survivors livingCells) ++ (unique (newBorns livingCells))

unique : Cells -> Cells
unique cells =
  case cells of
    (h :: t) -> if member h t then unique t else h :: unique t
    [] -> []

newBorns : Cells -> Cells
newBorns livingCells =
  List.concatMap (newBornsFor livingCells) livingCells

newBornsFor : Cells -> Cell -> Cells
newBornsFor livingCells cell =
  filter (isBorn livingCells) (deadNeighbours cell livingCells)

isBorn : Cells -> Cell -> Bool
isBorn livingCells cell =
  length (liveNeighbours cell livingCells) == 3

deadNeighbours : Cell -> Cells -> Cells
deadNeighbours cell livingCells =
  filter (isDead livingCells) (neighbours cell)

isAlive : Cells -> Cell -> Bool
isAlive livingCells cell =
  member cell livingCells

isDead : Cells -> Cell -> Bool
isDead livingCells cell =
  not (isAlive livingCells cell)

survivors : Cells -> Cells
survivors livingCells =
  filter (survive livingCells) livingCells

survive : Cells -> Cell -> Bool
survive livingCells cell  =
  let liveNeighboursCount = length (liveNeighbours cell livingCells)
  in liveNeighboursCount == 2 || liveNeighboursCount == 3

liveNeighbours : Cell -> Cells -> Cells
liveNeighbours cell livingCells =
  filter (isAlive livingCells) (neighbours cell)

neighbours : Cell -> Cells
neighbours (fst, snd) = [ (fst - 1, snd - 1)
                        , (fst    , snd - 1)
                        , (fst + 1, snd - 1)
                        , (fst - 1, snd    )
                        , (fst + 1, snd    )
                        , (fst - 1, snd + 1)
                        , (fst    , snd + 1)
                        , (fst + 1, snd + 1)
                        ]
