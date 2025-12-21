//
//  WeatherCity.swift
//  Iweather
//
//  Created by pablo henrique on 21/12/25.
//

import Foundation


struct WeatherCity: Decodable {
    let list: [ForecastItem]
}

struct ForecastItem: Decodable {
    let dt: Int
    let main: MainInfo
    let weather: [WeatherInfo]
}

struct Clouds: Codable {
    let all: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct MainInfo: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct WeatherInfo: Decodable {
    let description: String
    let icon: String
}
