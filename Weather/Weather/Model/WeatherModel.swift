//
//  WeatherInformation.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let city: City
    let list: [WeatherInfo]
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - WeatherInfo
struct WeatherInfo: Codable {
    let dtTxt: String
    let main: MainClass
    let weather: [Weather]
    let wind: Wind

    enum CodingKeys: String, CodingKey {
        case dtTxt = "dt_txt"
        case main, weather, wind
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let description: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
}
