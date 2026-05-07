module Main where

import System.Random (randomRIO)
import Control.Monad (replicateM)
import Control.Exception (evaluate)
import Data.Time.Clock.POSIX (getPOSIXTime)

import RedBlackTree
import PlayerData

addPlayer :: RBTree Entry -> PlayerId -> Score -> RBTree Entry
addPlayer tree pid score = insert (Entry score pid) tree 

topK :: Int -> RBTree Entry -> [Entry]
topK k tree = take k (reverse (inOrder tree))

buildVersions :: [(PlayerId, Score)] -> [RBTree Entry]
buildVersions updates = scanl step Empty updates
    where
        step tree (pid, score) = addPlayer tree pid score

printLeaderboard :: [Entry] -> IO ()
printLeaderboard entries =
    mapM_ printLine (zip [1..] entries)
    where
        printLine (rank, Entry score pid) =
            putStrLn (show rank ++ ". Jugador " ++ show pid ++ " | Puntaje: " ++ show score)

timeIO :: IO a -> IO a
timeIO action = do
    start <- getPOSIXTime
    result <- action
    end <- getPOSIXTime
    putStr ("Tiempo de inserción: " ++ show (end - start) ++ "\n")
    return result

main :: IO()
main = loop [Empty]

loop :: [RBTree Entry] -> IO ()
loop versions = do
    putStrLn "\n--- Menu de puntuaciones ---"
    putStrLn "Bienvenido al leaderboard de puntuaciones, elija una de las siguientes opciones:\n"
    putStrLn "1. Añadir puntuacion de jugador"
    putStrLn "2. Mostrar mejores jugadores"
    putStrLn "3. Salir"

    choice <- getLine

    case choice of
        "1" -> do
            putStrLn "Ingrese el id del jugador:"
            pidStr <- getLine
            putStrLn "\nIngrese la nueva puntuacion del jugador:"
            scoreStr <- getLine

            let pid   = read pidStr
                score = read scoreStr
                current = head versions
            
            newTree <- timeIO $ evaluate (addPlayer current pid score)

            loop (newTree : versions)

        "2" -> do
            let i = length versions

            putStrLn "Ingrese el tamaño del top que quiere buscar:"
            kStr <- getLine
            let k = read kStr

            putStrLn "\nIngrese el numero de leaderboard del que quiere hacer query:"
            putStrLn "(0 = reciente, 1 = previo al reciente, 2 = 2 veces previo al reciente...)"
            putStrLn ("Leaderboards guardados (contando el mas reciente): " ++ show (i))

            nStr <- getLine
            let n = read nStr

            if n < i
                then printLeaderboard (topK k (versions !! n))
                else putStrLn "No existe un leaderboard de tal antiguedad"

            loop versions

        "3" -> do
            putStrLn "Gracias por usar el menu, esperamos verlo pronto"

        _ -> do
            putStrLn "Opcion invalida"
            loop versions