//
//  WeatherViewController.swift
//  gismeteo
//
//  Created by islam on 20.02.2022.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        
    }
    
    
    @IBOutlet weak var txt: UITextField!
    
    @IBAction func pressedButton(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        let city = txt.text ?? "" // еще не дошли руки
        NetworkService.shared.getTheWeather(city: city)
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
            }
        }
      

    
    

