module GameOfLife.Patterns (flicker, gosperGun) where

import GameOfLife.Types exposing (Cells)

flicker : Cells
flicker = [(1, 1), (0, 1), (2, 1)]

gosperGun : Cells
gosperGun =  [
  (1,5), (2,5), (1,6), (2,6),
  (35,3), (36,3), (35,4), (36,4),
  (11,5), (11,6), (11,7), (12,4), (12,8),
  (13,3), (14,3), (13,9), (14,9), (15,6),
  (16,4), (16,8), (17,5), (17,7), (17,6), (18,6),
  (21,3), (21,4), (21,5), (22,3), (22,4), (22,5),
  (23,2), (23,6), (25,2), (25,1), (25,6), (25,7)]