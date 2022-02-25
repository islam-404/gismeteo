//
//  GetWeatherResponse.swiftF
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import Foundation
 // GetWeatherResponse
struct GetWeatherResponse {
    typealias JSON = [String: AnyObject]
    let weathers: [Weather]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else { throw NetworkError.failInternetError }
        
        var weathers = [Weather]()
        for dictionary in array {
            guard let weather = Weather(dict: dictionary) else { continue }
            weathers.append(weather)
        }
        self.weathers = weathers
    }
}
