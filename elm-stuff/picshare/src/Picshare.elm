module Picshare exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, src)


baseUrl : String
baseUrl =
    "https://programming-elm.com/"


main : Html msg



-- main =
--   div []
--     [ div [ class "header" ]
--       [ h1 [] [ text "Picshare" ] ]
--     , div [ class "content-flow" ]
--         [ div [ class "detailed-photo" ]
--           [ img [ src "https://programming-elm.com/1.jpg" ] []
--           , div [ class "photo-info" ]
--             [ h2 [ class "caption" ] [ text "Surfing" ] ]
--           ]
--         ]
--     ]


main =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto (baseUrl ++ "1.jpg") "Surfing"
            , viewDetailedPhoto (baseUrl ++ "2.jpg") "The Fox"
            , viewDetailedPhoto (baseUrl ++ "3.jpg") "Evening"
            ]
        ]


viewDetailedPhoto : String -> String -> Html msg
viewDetailedPhoto url caption =
    div [ class "detailed-photo" ]
        [ img [ src url ] []
        , div [ class "photo-info" ]
            [ h2 [ class "caption" ] [ text caption ] ]
        ]
