//
//  Weather.swift
//  sample-weather
//
//  Created by saeid on 11/8/23.
//

import Foundation

struct WeatherResponse: Decodable{
    var main: Weather?
    var weather: [WeatherModel]?
}

struct Weather: Decodable{
    var temp: Double?
}

struct WeatherModel: Decodable{
    var main: String?
}


struct WeatherResponse: Decodable{
    var main: Weather?
    var weather: [WeatherModel]?
}

struct Weather: Decodable{
    var temp: Double?
}

struct WeatherModel: Decodable{
    var main: String?
}
