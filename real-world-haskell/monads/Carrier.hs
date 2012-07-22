-- file monads/Carrier.hs
import qualified Data.Map as M

type PersonName     = String
type PhoneNumber    = String
type BillingAddress = String
type MobileCarrier  = Honest_Bobs_Phone_Network
                    | Morrisas_Marvelous_Mobiles
                    | Petes_Plutocratic_Phones

findCarrierBillingAddress :: PersonName
                          -> M.Map PersonName PhoneNumber
                          -> M.Map PhoneNumber MobileCarrier
                          -> M.Map MobileCarrier BillingAddress
                          -> Maybe BillingAddress

variation1 
