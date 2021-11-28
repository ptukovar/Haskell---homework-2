# Crossword Answers
Lets define a data types representing a deck of Poker cards. In Poker, a player gets 5 cards into the hand. Dealt hands are classified into several categories. These categories are important to define who is the winner. Rules for each category cen be found [Here](https://en.wikipedia.org/wiki/Poker)

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
