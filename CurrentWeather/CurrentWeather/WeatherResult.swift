//
//  WeatherResult.swift
//  CurrentWeather
//
//  Created by Abhishek Mishra on 30/03/20.
//  Copyright © 2020 InnoIntell. All rights reserved.
//

import Foundation



struct WeatherResult: Decodable {
    let main: Weather
}


struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}


extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0, humidity: 0))
    }
}
