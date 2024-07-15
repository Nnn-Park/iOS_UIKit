//
//  WeatherInformation.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

// MARK: - Weather
struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
