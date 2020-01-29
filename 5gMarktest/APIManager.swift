//
//  APIManager.swift
//  5gMarktest
//
//  Created by Prasenjit Das on 29/01/20.
//  Copyright © 2020 Prasenjit Das. All rights reserved.
//

import UIKit
import SwiftyJSON

class APIManager: NSObject {
    
        let baseURL = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
        static let sharedInstance = APIManager()
       static let getPostsEndpoint = "/users/"
        
        func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL //+ APIManager.getPostsEndpoint //+ String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do {
                    let result = try JSON(data: data!)
                    onSuccess(result)
                } catch {
                    print("error")
                }
                
            }
        })
        task.resume()
    }

}
