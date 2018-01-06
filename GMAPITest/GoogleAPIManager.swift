//
//  GoogleAPIManager.swift
//  GMAPITest
//
//  Created by ADMIN on 30.06.17.
//  Copyright © 2017 ADMIN. All rights reserved.
//

import UIKit

class GoogleAPIManager: NSObject {
  
  static let currentManager = GoogleAPIManager()

  private let googleApiKey = "AIzaSyBlIoyR7XjMjaCM1C1chYoLrrR3yoFiYWk"
  
  func receiveAllPlacesWithSearchText(_ text : String!, completion : @escaping (_ result : Array<Any>?) -> ()) {
    
    let urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(text!)&key=\(googleApiKey)"
    let url = URL.init(string: urlString)
    
    if url != nil {
      

      URLSession.shared.dataTask(with: url!, completionHandler: { (data, urlResponse, error) in
        if error == nil {
          
          do {
            let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
            
            completion(parsedData["results"] as? Array<Any>)
          }catch let parseError as NSError {
            print(parseError)
            completion(nil)
          }
          
        }else{
      
          print(error)
          completion(nil)
        }
      }).resume()
      
    }else{
      completion(nil)
    }
  }
  
}
