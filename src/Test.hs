{-# LANGUAGE OverloadedStrings #-}

module Test where



import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Simple


test1 :: IO ()
test1 = do
  response <- httpLBS "http://httpbin.org/get"
  putStrLn $ "The status code was " ++
              show (getResponseStatusCode response)
  print $ getResponseHeader "Content-type" response
  L8.putStrLn $ getResponseBody response