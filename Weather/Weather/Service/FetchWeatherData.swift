//
//  FetchData.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import UIKit
import Alamofire

struct FetchWeatherData {
    private let apiKey = "e02a5d98726ce802caa73039f0b7f4fc"
    
    func fetchData(cityName: String, completionHandler: @escaping (Weather?, AFError?) -> Void) {
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"
        
        DispatchQueue.global().async {
            AF.request(url).responseDecodable(of: Weather.self) { response in
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
