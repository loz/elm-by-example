import Graphics.Element exposing (..)
import Text

--This no longer exists, so wrap it
plaintext: String -> Element
plaintext s = 
   leftAligned (Text.fromString s)

main = plaintext "Hello World!"
