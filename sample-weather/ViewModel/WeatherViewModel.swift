//
//  WeatherViewModel.swift
//  sample-weather
//
//  Created by saeid on 11/8/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject{
    let weatherService: WeatherService
    var city: String = ""
    @Published var weather = WeatherResponse()
    @Published var loading = false
    var temeture: String{
        get{
            guard let temp = self.weather.main?.temp else {return ""}
            return String(format: "%.0f", temp)
        }
    }
    
    var isCloude: String{
        get{
            guard let temp = self.weather.main?.temp else {return ""}
            return String(format: "%.0f", temp)
        }
    }
    
    var isRainyMode: Bool{
        get{
            self.weather.weather?.first?.main?.contains("Rain") ?? false
        }
    }
    
    init(weatherService: WeatherService? = nil) {
        self.weatherService = weatherService ?? WeatherService()
    }
    
    func search(){
        guard let city = self.city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        self.fetchWeather(by: city)
    }
    
    private func fetchWeather(by city: String){
        self.loading = true
        self.weatherService.getWeather(city){ result in
            DispatchQueue.main.async {
                self.loading = false
            }
            if let result = result {
                DispatchQueue.main.async {
                    self.weather = result
                }
            }
        }
    }
    
}

