//
//  ViewController.swift
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
//
//    var weather = [Weather]()
    @IBOutlet weak var tableWeatherCity: UITableView!
    
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableWeatherCity.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.cityPreservation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableVCCell
        let nameCity = Base.shared.cityPreservation[indexPath.row]
        let cityTypeURL = nameCity.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)  ?? "" // перенести в отдельный файл типа кодирование имени
        cell.configure(nameCity: cityTypeURL, delegate: self)
        return cell
    }
}

extension ViewController: WeatherTableVCDelegate {
    func deleteButton(nameCity: String) {
        let alert = UIAlertController(title: "\(nameCity)", message: "Вы действительно хотите удалить", preferredStyle: .alert)
        let yesBtn = UIAlertAction(title: "Да", style: .default) { _ in
            Base.shared.deleteCity(nameCity)
            self.tableWeatherCity.reloadData()
    }
        let noBtn = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        alert.addAction(noBtn)
        alert.addAction(yesBtn)
        present(alert, animated: true)
    }
}
