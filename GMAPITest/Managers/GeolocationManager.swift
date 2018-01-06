//
//  GeolocationManager.swift
//  GMAPITest
//
//  Created by ALEXANDER CHANCHIKOV on 30.06.17.
//  Copyright © 2017 ALEXANDER CHANCHIKOV. All rights reserved.
//

import UIKit
import CoreLocation

class GeolocationManager: NSObject {

  static let sharedManager = GeolocationManager()
  
  var locationManager = CLLocationManager?
  
  var currentLocation : CLLocationCoordinate2D?
  
  
  
  
}
