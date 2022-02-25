//
//  NetworkRequest.swift
//  gismeteo
//
//  Created by islam on 23.02.2022.
//
import UIKit
import Foundation
import Alamofire
class  NetworkService {
    static let shared = NetworkService()
    public func getTheWeather(city: String) -> () {
    let cityTypeURL = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)  ?? "" // дошел 
    let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityTypeURL)&units=metric&appid=4f99e23623c0c1dca52c1a64c1172c45&lang=ru"
AF.request(url).responseDecodable(of: Weather.self) { (response) in
    
        guard let _: Weather = response.value else { return }
    Base.shared.saveCity(city)
    }
}
}
