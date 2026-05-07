module RedBlackTree where

    data Color = R | B deriving (Show, Eq)
    data RBTree a = Empty | Node Color (RBTree a) a (RBTree a) deriving (Show, Eq)

    member :: Ord a => a -> RBTree a -> Bool
    member _ Empty = False
    member x (Node _ left y right)
        | x < y     = member x left
        | x > y     = member x right
        | otherwise = True
    

    balance :: Color -> RBTree a -> a -> RBTree a -> RBTree a
    -- Left-left case
    balance B (Node R (Node R a x b) y c) z d =
        Node R (Node B a x b) y (Node B c z d)

    -- Left-right case
    balance B (Node R a x (Node R b y c)) z d =
        Node R (Node B a x b) y (Node B c z d)

    -- Right-left case
    balance B a x (Node R (Node R b y c) z d) =
        Node R (Node B a x b) y (Node B c z d)

    -- Right-right case
    balance B a x (Node R b y (Node R c z d)) =
        Node R (Node B a x b) y (Node B c z d)

    -- Default (no violation)
    balance color left val right =
        Node color left val right


    insert :: Ord a => a -> RBTree a -> RBTree a
    insert x tree = makeBlack (ins tree)
        where
            ins Empty = Node R Empty x Empty
            ins (Node color left y right)
                | x < y     = balance color (ins left) y right
                | x > y     = balance color left y (ins right)
                | otherwise = Node color left y right  -- no duplicates

            makeBlack (Node _ l v r) = Node B l v r
            makeBlack Empty = Empty

    inOrder :: RBTree a -> [a]
    inOrder Empty = []
    inOrder (Node _ l x r) = inOrder l ++ [x] ++ inOrder r