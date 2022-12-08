-- Matrix digital rain
import System.Random

-- Prints whitespace 1-5 times, randomly
printRandomSpace :: IO ()
printRandomSpace = do
  number <- randomRIO (1, 5) :: IO Int
  putStr $ unwords $ replicate number " "

-- Randomly selects an element from passed list
getRandomNumber :: [Int] -> IO Int
getRandomNumber list = do
  i <- randomRIO (0, length list - 1) :: IO Int
  return $ list !! i

-- Passes the list as argument to function getRandomNumber, and then prints the returned value
printRandomNumber :: IO ()
printRandomNumber = do
  x <- getRandomNumber [0, 1]
  putStr . show $ x

-- Infinite loop, calls functions printRandomSpace and printRandomNumber, and then calls itself
rain :: IO ()
rain = do
  printRandomSpace
  printRandomNumber
  rain

main :: IO ()
main = do
  putStrLn $ "\ESC[92m" -- sets text color in terminal (tried on Ubuntu)
  rain
