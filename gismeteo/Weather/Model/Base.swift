//
//  File.swift
//  gismeteo
//
//  Created by islam on 25.02.2022.
//

import Foundation

class Base {
    let defaults = UserDefaults.standard
    
    static let shared = Base()
    var cityPreservation:[String]{
        get {
            let cities = defaults.array(forKey: "cityPreservation") as?  [String] ?? []
            return cities
        }
        set {
            var cities = defaults.array(forKey: "cityPreservation") as?  [String] ?? []
            cities.insert(contentsOf: newValue, at: 0)
            defaults.set(cities, forKey: "cityPreservation")
        }
    }
    func saveCity(_ nameCity: String){
        print(nameCity)
        cityPreservation = [nameCity]
    }
    
    func deleteCity(_ nameCity: String){
        var arrayCity = cityPreservation
        var indexArray = Int()
        for (index, value) in arrayCity.enumerated() {
            if value == nameCity {
                indexArray = index
            }
        }
        print(indexArray)
        arrayCity.remove(at: indexArray)
        defaults.removeObject(forKey: "cityPreservation")
        cityPreservation = arrayCity
//        defaults.removeObject(forKey: "cityPreservation")
    }
}
