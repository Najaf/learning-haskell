data Address = Address { line1 :: String
                  , line2 :: String
                  , town  :: String
                  , postCode :: String
                  } (deriving Show)

data Customer = Customer { firstName :: String
                    , lastName  :: String 
                    , address   :: Address
                    } (deriving Show)

theAddress :: Address
theAddress = Address { line1="23 Testtown", line2="Somewheton Road", town="Sometown", postCode="123 456" }

theCustomer :: Customer 
theCustomer = Customer { firstName="Fred", lastName="Cheesemeister", address=theAddress }

main = do putStrLn theCustomer


