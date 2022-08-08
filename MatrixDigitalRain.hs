-- Toni Baskijera, Matrix digital rain
import System.Random

-- Ispisuje razmak 1-5 puta, nasumično
printRandomSpace :: IO ()
printRandomSpace = do
  number <- randomRIO (1, 5) :: IO Int
  putStr $ unwords $ replicate number " "

-- Odabire nasumičan element iz proslijeđene liste
getRandomNumber :: [Int] -> IO Int
getRandomNumber list = do
  i <- randomRIO (0, length list - 1) :: IO Int
  return $ list !! i

-- Prosljeđuje listu funkciji getRandomNumber te zatim ispisuje povratnu vrijednost
printRandomNumber :: IO ()
printRandomNumber = do
  x <- getRandomNumber [0, 1]
  putStr . show $ x

-- Infinite petlja, poziva funkcije koje ispisuju nasumičan broj razmaka i nasumični broj respektivno, te zatim ponovno poziva samu sebe
rain :: IO ()
rain = do
  printRandomSpace
  printRandomNumber
  rain

main :: IO ()
main = do
  putStrLn $ "\ESC[92m" -- postavljanje boje teksta terminala u zelenu boju, isprobano na Ubuntu
  rain
