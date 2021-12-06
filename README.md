# Poker
Lets define a data types representing a deck of Poker cards. In Poker, a player gets 5 cards into the hand. Dealt hands are classified into several categories. These categories are important to define who is the winner. Rules for each category can be found [Here](https://en.wikipedia.org/wiki/Poker)

Write a function `decide` that takes 5 dealt cards - `Hand` and returns a poker category in which it fits.
```haskell
decide:: Hand -> Category
```
___________________________________________________________________________________________________________________________________________________________________________________
**Base code**

```haskell
data Suit = Hearts | Clubs | Diamonds | Spades deriving (Eq, Show)
data Rank = Numeric Int | Jack | Queen | King | Ace deriving (Eq, Show)
data Card = Card Rank Suit deriving (Eq, Show)
type Hand = [Card]
data Category = RoyalFlush
              | StraightFlush
              | Four
              | FullHouse
              | Flush
              | Straight
              | Three
              | TwoPair
              | Pair
              | HighCard deriving (Eq, Show)
```
___________________________________________________________________________________________________________________________________________________________________________________
**Result**
```haskell
Prelude> decide [Card (Numeric 2) Hearts,Card (Numeric 2) Clubs,Card Ace Hearts,Card Ace Clubs,Card King Spades]
TwoPair
Prelude> decide [Card (Numeric 2) Hearts,Card (Numeric 2) Clubs,Card Ace Hearts,Card Ace Clubs,Card Ace Spades]
FullHouse
Prelude> decide [Card Ace Hearts,Card (Numeric 2) Hearts,Card (Numeric 5) Hearts,Card (Numeric 3) Hearts,Card (Numeric 4) Clubs]
Straight
Prelude> decide [Card (Numeric 2) Hearts,Card (Numeric 5) Clubs,Card Ace Hearts,Card King Clubs,Card Jack Spades]
HighCard
```


***EDUCATIONAL PURPOSES ONLY***
