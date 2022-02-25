//
//  WeatherNetworkService.swift
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import Foundation

class WeatherNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetWeatherResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetWeatherResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
