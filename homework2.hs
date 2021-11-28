import Data.List

data Suit = Hearts | Clubs | Diamonds | Spades deriving (Eq, Ord, Show)

data Rank = Numeric Int | Jack | Queen | King | Ace deriving (Eq, Ord, Show)

data Card = Card Rank Suit deriving (Eq, Ord, Show)

type Hand = [Card]

data Category
  = RoyalFlush
  | StraightFlush
  | Four
  | FullHouse
  | Flush
  | Straight
  | Three
  | TwoPair
  | Pair
  | HighCard
  deriving (Eq, Ord, Show)

isRankAfter :: Rank -> Rank -> Bool
isRankAfter Ace (Numeric 2) = True
isRankAfter (Numeric 2) Ace = True
isRankAfter (Numeric a) (Numeric b) = a + 1 == b
isRankAfter (Numeric 10) Jack = True
isRankAfter Jack Queen = True
isRankAfter Queen King = True
isRankAfter King Ace = True
isRankAfter _ _ = False

getRank :: Card -> Rank
getRank (Card x y) = x

getSuit :: Card -> Suit
getSuit (Card x y) = y

sortGroupBySuit :: [Card] -> [[Card]]
sortGroupBySuit =
  groupBy (\(Card rank1 suit1) (Card rank2 suit2) -> suit1 == suit2)
    . sortOn (\(Card rank suit) -> suit)

sortByRank :: [Card] -> [Card]
sortByRank = sortOn (\(Card rank suit) -> rank)

sortGroupByRank :: [Card] -> [[Card]]
sortGroupByRank =
  groupBy (\(Card rank1 suit1) (Card rank2 suit2) -> rank1 == rank2)
    . sortOn (\(Card rank suit) -> rank)

getGroupLengths :: [[Card]] -> [Int]
getGroupLengths = map length

isPair :: [Card] -> Bool
isPair groups
  | length (filter (== 2) (getGroupLengths (sortGroupByRank groups))) == 1 = True
  | otherwise = False

isTwoPair :: [Card] -> Bool
isTwoPair groups
  | length (filter (== 2) (getGroupLengths (sortGroupByRank groups))) == 2 = True
  | otherwise = False

isThree :: [Card] -> Bool
isThree groups
  | length (filter (== 3) (getGroupLengths (sortGroupByRank groups))) == 1 = True
  | otherwise = False

isFour :: [Card] -> Bool
isFour groups
  | length (filter (== 4) (getGroupLengths (sortGroupByRank groups))) == 1 = True
  | otherwise = False

isFullHouse :: [Card] -> Bool
isFullHouse groups
  | length (filter (== 3) (getGroupLengths (sortGroupByRank groups))) == 1 && length (filter (== 2) (getGroupLengths (sortGroupByRank groups))) == 1 = True
  | otherwise = False

isFlush :: [Card] -> Bool
isFlush card
  | length (getGroupLengths (sortGroupBySuit card)) == 1 = True
  | otherwise = False

aceProblem :: [Card] -> Bool
aceProblem [Card rank1 suit1, Card rank2 suit2, Card rank3 suit3, Card rank4 suit4, Card rank5 suit5]
  | rank1 == Numeric 2 && rank5 == Ace && rank2 == Numeric 3 && rank3 == Numeric 4 && rank4 == Numeric 5 = True
  | otherwise = False

isStraight :: [Card] -> Bool
isStraight cards
  | all (uncurry isRankAfter) (zip (fmap getRank cards) (tail (fmap getRank cards))) = True
  | otherwise = False

isStraightFlush :: [Card] -> Bool
isStraightFlush cards
  | (isStraight cards || aceProblem cards) && isFlush cards = True
  | otherwise = False

decide :: [Card] -> Category
decide card
  | isStraightFlush cards = StraightFlush
  | isFour cards = Four
  | isFullHouse cards = FullHouse
  | isFlush cards = Flush
  | isStraight cards || aceProblem cards = Straight
  | isThree cards = Three
  | isTwoPair cards = TwoPair
  | isPair cards = Pair
  | otherwise = HighCard
  where
    cards = sortByRank card
