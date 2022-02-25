//
//  ViewController.swift
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var weather = [Weather]()
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableVCCell else { return UITableViewCell() }
        let nameCity = Base.shared.cityPreservation[indexPath.row]
        let cityTypeURL = nameCity.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)  ?? "" // перенести в отдельный файл типа кодирование имени
        cell.configure(nameCity: cityTypeURL, delegate: self)
        return cell
    }
}

extension ViewController: WeatherTableVCDelegate {
    func deleteButton() {
        let alert = UIAlertController(title: "title", message: "description", preferredStyle: .alert)
        let yesBtn = UIAlertAction(title: "Да", style: .default, handler: nil)
        let noBtn = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        alert.addAction(yesBtn)
        alert.addAction(noBtn)
        present(alert, animated: true)
    }
}
