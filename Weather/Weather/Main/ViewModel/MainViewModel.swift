//
//  MainViewModel.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

class MainViewModel {
    
    var inputWeather: Observerable<Void?> = Observerable(nil)
    
    var outputData: Observerable<WeatherResponse?> = Observerable(nil)
    var outputWeatherInfo: Observerable<[WeatherInfo]> = Observerable([])
    var outputCityName: Observerable<String> = Observerable("")
    
    
    init() {
        inputWeather.bind { _ in
            FetchWeatherData.shared.getData(cityName: "seoul") { weather, error in
                self.outputCityName.value = weather?.city.name ?? "000"
                self.outputWeatherInfo.value = weather?.list ?? []
            }
        }
        
        
    }
    
    
    
}
