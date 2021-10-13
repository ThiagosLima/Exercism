module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven : Int
expectedMinutesInOven =
    40


preparationTimeInMinutes : Int -> Int
preparationTimeInMinutes numberOfLayers =
    numberOfLayers * 2


elapsedTimeInMinutes : Int -> Int -> Int
elapsedTimeInMinutes numberOfLayers minutesInOven =
    preparationTimeInMinutes numberOfLayers + minutesInOven
