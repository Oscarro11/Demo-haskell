module PlayerData where

    type PlayerId = Int
    type Score    = Int

    data Entry = Entry Score PlayerId
        deriving (Eq, Show)

    instance Ord Entry where
        compare (Entry s1 p1) (Entry s2 p2) =
            compare s1 s2 <> compare p1 p2