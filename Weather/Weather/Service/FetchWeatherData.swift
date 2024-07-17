//
//  FetchData.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import UIKit
import Alamofire

final class FetchWeatherData {
    
    static let shared = FetchWeatherData()
    
    private let apiKey = "e02a5d98726ce802caa73039f0b7f4fc"
    
    func getData(cityName: String, completionHandler: @escaping (WeatherResponse?, AFError?) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"
        
        DispatchQueue.global().async {
            AF.request(url).responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("SUCESS")
                    DispatchQueue.main.async {
                        completionHandler(data, nil)
                    }
                case .failure(let error):
                    print("ERROR")
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
