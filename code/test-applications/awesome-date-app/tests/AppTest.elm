module AppTest exposing (suite)

import App
import AwesomeDate as Date exposing (Date)
import Expect
import Test exposing (..)


selectedDate : Date
selectedDate =
    Date.create 2012 6 2


futureDate : Date
futureDate =
    Date.create 2015 9 21


initialModel : App.Model
initialModel =
    { selectedDate = selectedDate
    , years = Nothing
    , months = Nothing
    , days = Nothing
    }


modelWithDateOffsets : App.Model
modelWithDateOffsets =
    { initialModel
        | years = Just 3
        , months = Just 2
        , days = Just 50
    }


selectDate : Date -> App.Msg
selectDate date =
    App.SelectDate (Just date)


changeDateOffset : App.DateOffsetField -> Int -> App.Msg
changeDateOffset field amount =
    App.ChangeDateOffset field (Just amount)


testUpdate : Test
testUpdate =
    todo "implement update tests"


testView : Test
testView =
    todo "implement view tests"


testEvents : Test
testEvents =
    todo "implement event tests"


suite : Test
suite =
    describe "App"
        [ testUpdate
        , testView
        , testEvents
        ]
