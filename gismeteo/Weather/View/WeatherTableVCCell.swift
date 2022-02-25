//
//  WeatherTableVCCell.swift
//  gismeteo
//
//  Created by islam on 24.02.2022.
//

import UIKit
import Alamofire
import SDWebImage

protocol WeatherTableVCDelegate: AnyObject {
    func deleteButton(nameCity: String)
}

class WeatherTableVCCell: UITableViewCell {

    weak var delegate: WeatherTableVCDelegate?
    
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var tempCity: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var speedWind: UILabel!
    @IBOutlet weak var degWind: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    
    
    func configure(nameCity: String, delegate: WeatherTableVCDelegate) {
        self.delegate = delegate
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(nameCity)&units=metric&appid=4f99e23623c0c1dca52c1a64c1172c45&lang=ru"
    AF.request(url).responseDecodable(of: Weather.self) { (response) in
            
            guard let cityWeather: Weather = response.value else { return }
            self.nameCity.text = cityWeather.name
            self.tempCity.text = "Tемпература воздуха \(String(cityWeather.main.temp!)) °C"
            self.weatherDescription.text = "\(String(cityWeather.weather[0].description!))"
            self.feelsLike.text = "по ощущениям \(String(cityWeather.main.feels_like ?? 0)) °C"
            self.humidity.text = "Влажность воздуха \(String(cityWeather.main.humidity ?? 0))"
            self.speedWind.text = "Скорость ветра \(String(cityWeather.wind!.speed ?? 0))"
            self.degWind.text = "направление \(String(cityWeather.wind!.deg ?? 0))"
            self.iconWeather.sd_setImage(with: URL(string: "https://openweathermap.org/img/wn/\(String(cityWeather.weather[0].icon!))@2x.png"))
        }
    }
    
    
    @IBAction func pressedDeleteButton(_ sender: UIButton) {
        delegate?.deleteButton(nameCity: nameCity.text!)
    }
    
    


}
