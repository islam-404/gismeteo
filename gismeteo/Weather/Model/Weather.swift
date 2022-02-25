//
//  Weather.swift
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import Foundation

struct Weather: Decodable {
    let weather: [WeatherDate] // описание погоды
    let main: Main // описание погоды
    let visibility: Int?
    let wind: Wind? // ветер
    let clouds: Clouds? //облака
    let name: String? // название города
//    let cod: String?
    var cod: Int?
//        get {
//            print("dfsfsdfsdfdsfsdfsf")
//            return Int()
//        } set {
//            print("dfsfsdfsdfdsfsdfsf")
//            print("dfsfsdfsdfdsfsdfsf")
//        }
//    }
}

// MARK: - Clouds
struct Clouds: Decodable { // облака
    let all: Int?
}
// MARK: - Main
struct Main: Decodable {
    let temp, feels_like, tempMin, tempMax: Double? // температура, по ощущениям
    let humidity: Int? // влажность
}

// MARK: - Weather
struct WeatherDate: Decodable {
    let main, description, icon: String? // _ , описание погоды, иконка погоды
}

// MARK: - Wind
struct Wind: Codable { // ветер
    let speed: Double? // скорость
    let deg: Int? // напрравление
    let gust: Double? // порыв?
}
