//
//  WeatherService.swift
//  sample-weather
//
//  Created by saeid on 11/8/23.
//

import Foundation

class WeatherService{
    
    func getWeather(_ city: String, compeletion: @escaping (WeatherResponse?) -> ()){
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a3205ee94e31e3f427bd2d6339384e23") else{
            compeletion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else {
                compeletion(nil)
                return
            }
            
            if let result = try? JSONDecoder().decode(WeatherResponse.self, from: data){
                compeletion(result)
                return
            }else{
                compeletion(nil)
            }
        }.resume()
    }

    func getWeathersa(_ city: String, compeletion: @escaping (WeatherResponse?) -> ()){
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a3205ee94e31e3f427bd2d6339384e23") else{
            compeletion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else {
                compeletion(nil)
                return
            }
            
            if let result = try? JSONDecoder().decode(WeatherResponse.self, from: data){
                compeletion(result)
                return
            }else{
                compeletion(nil)
            }
        }.resume()
    }
}
