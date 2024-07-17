//
//  MainViewModel.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

class MainViewModel {
    
    var outputData: Observerable<WeatherResponse?> = Observerable(nil)
    
    var inputWeather: Observerable<Void?> = Observerable(nil)
    
    var outputWeatherTitle: Observerable<String?> = Observerable(nil)
    
    init() {
        inputWeather.bind {_ in 
            FetchWeatherData.shared.getData(cityName: "seoul") { weather, error in
                self.outputData.value = weather
            }
        }
    }
    
    
    
}
