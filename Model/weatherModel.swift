//
//  weatherModel.swift
//  5gMarktest
//
//  Created by Prasenjit Das on 29/01/20.
//  Copyright © 2020 Prasenjit Das. All rights reserved.
//

import UIKit
import SwiftyJSON


protocol JSONable {
    init?(parameter: JSON)
}

class weatherModel: JSONable {
    
    let lat             :String!
    let lan             :String!
    var weatherID       :String!
    var weatherMain      :String!
    var weatherDescription: String!
    let base :String!
    let mainTemp: String!
    let mainPressure: String!
    let mainHumidity : String!
    let mainTempMin  :String!
    let mainTempMax :String!
    let windSpeed: String!
    let windDegree: String!
    let cloudsAll: String!
    let sysCountry: String!
    let sysSunrise : String!
    let sysSunset: String!
    let name : String!
    
    
    
    required init(parameter: JSON) {
        name          = parameter["name"].stringValue
        lat           = parameter["coord"]["lat"].stringValue
        lan           = parameter["coord"]["lon"].stringValue
        
        if let weather = parameter["weather"].array {
            for weatherItem in weather {
                weatherID = weatherItem["id"].stringValue
                weatherMain = weatherItem["main"].stringValue
                weatherDescription = weatherItem["description"].stringValue
            }
        }
        base             = parameter["base"].stringValue
        mainTemp        = parameter["main"]["temp"].stringValue
        mainPressure    = parameter["main"]["pressure"].stringValue
        mainHumidity    = parameter["main"]["humidity"].stringValue
        mainTempMin     = parameter["main"]["temp_min"].stringValue
        mainTempMax     = parameter["main"]["temp_max"].stringValue
        windSpeed     = parameter["wind"]["speed"].stringValue
        windDegree     = parameter["wind"]["deg"].stringValue
        cloudsAll     = parameter["clouds"]["all"].stringValue
        sysCountry     = parameter["sys"]["country"].stringValue
        sysSunset      = parameter["sys"]["sunrise"].stringValue
        sysSunrise     = parameter["sys"]["sunset"].stringValue
        
    }
}


