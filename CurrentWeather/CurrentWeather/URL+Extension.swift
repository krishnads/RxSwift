//
//  URL+Extension.swift
//  CurrentWeather
//
//  Created by Abhishek Mishra on 30/03/20.
//  Copyright © 2020 InnoIntell. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
       
        let urlStr = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a1c33ad2a2aac4508bb92620c0504704"
        
        return URL(string: urlStr)
    }
}
