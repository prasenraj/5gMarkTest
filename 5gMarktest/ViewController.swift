//
//  ViewController.swift
//  5gMarktest
//
//  Created by Prasenjit Das on 29/01/20.
//  Copyright © 2020 Prasenjit Das. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    
    var datamodel = [weatherModel]()

    var cellReuseIdentifier = "cell"
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherLbl:UILabel!
    @IBOutlet weak var latLbl:UILabel!
    @IBOutlet weak var longLbl:UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var tempMaxLbl:UILabel!
    
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
    
    func callRestAPI(){
        APIManager.sharedInstance.getPostWithId(postId: 1, onSuccess: { json in
                self.datamodel.append(weatherModel.init(parameter: json))
      
            DispatchQueue.main.async {
                print(json)
                self.updateLbl()
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    
    func updateLbl(){
         let temp: weatherModel
         temp = datamodel[0]
        self.cityName.text = temp.name
        self.weatherLbl.text = temp.weatherDescription
        self.latLbl.text  = temp.lat
        self.longLbl.text = temp.lan
        self.tempMinLbl.text = temp.mainTempMin
        self.tempMaxLbl.text = temp.mainTempMax

    }
    @IBAction func clickMeButtonAction(){
         callRestAPI()
    }
    
}

