# Haskell---homework-2
# Crossword Answers
Implement the function answers that takes as an input a crosword puzzle's solution and outputs all words from this solution. Words will be divided into two lists, first for lines (from left to right) and second for columns (from top to bottom). A word is written only if it is longer than just one character.

- TIP: Use the function `words` to split lines into sequence of words.
```haskell 
words :: String -> [String]
------------------------------------
*Main> words "ABC cdef ghijkl"
["ABC","cdef","ghijkl"]
```

___________________________________________________________________________________________________________________________________________________________________________________
**Base code**

```haskell
solution1 = ["DAD  SEND",
             "O EAST  A",
             "W A  ITSY",
             "NERF N T ",
             " A ARK U ",
             " S T SYNC",
             "MESH  A A",
             "A  EVER R",
             "NEAR  D D"]

answers :: Result -> ([String],[String])
```
___________________________________________________________________________________________________________________________________________________________________________________
**Result**
```haskell
*Main> answers solution1 
(["DAD","SEND","EAST","ITSY","NERF","ARK","SYNC","MESH","EVER","NEAR"],["DOWN","MAN","EASE","DEAR","FATHER","STINKS","YARD","STUN","DAY","CARD"])
```


***EDUCATIONAL PURPOSES ONLY***
