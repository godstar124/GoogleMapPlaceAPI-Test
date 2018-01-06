//
//  CurrentLocationVC.swift
//  GMAPITest
//
//  Created by ADMIN on 30.06.17.
//  Copyright © 2017 ADMIN. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocationVC: UIViewController {

  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var locationLabel: UILabel!
  
  @IBOutlet weak var searchTextField: UITextField!
  var geolocationMnager : CLLocationManager!
  
  var resultsForSegue : Array<Any>?
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
  
    geolocationMnager = CLLocationManager()
    geolocationMnager.delegate = self
    geolocationMnager.requestWhenInUseAuthorization()
    geolocationMnager.startUpdatingLocation()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    
    self.locationLabel.text = "--- : ---"
  }
  
  override func didReceiveMemoryWarning() {
  
    super.didReceiveMemoryWarning()
  
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "openResultSegueID" {
      let controller = segue.destination as! ResultsAPIVC
      controller.setResultsData(resultsForSegue!)
      resultsForSegue = nil
    }
  }
  
  @IBAction func submitButtonTap(_ sender: Any) {
    
    if (self.searchTextField.text?.characters.count)! < 1 {
      let alert = UIAlertController.init(title: "", message: "Please input text for submit", preferredStyle: .alert)
      
      let okAction = UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
        
        DispatchQueue.main.async {
          self.searchTextField.becomeFirstResponder()
        }
      })
      alert.addAction(okAction)
      
      self.present(alert, animated: true, completion: nil)
    }else{
    
      GoogleAPIManager.currentManager.receiveAllPlacesWithSearchText(self.searchTextField.text) { (result) -> () in
        
        self.resultsForSegue = result
        DispatchQueue.main.async {
          self.performSegue(withIdentifier: "openResultSegueID", sender: nil)
        }
      }
    }
  }
  
}

extension CurrentLocationVC : UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    self.submitButtonTap(self.submitButton)
    
    return true
  }
}

extension CurrentLocationVC : CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let location = locations.first

    if location != nil {
      self.locationLabel.text = "\((location?.coordinate.latitude)!) : \((location?.coordinate.longitude)!)"
    }else{
      self.locationLabel.text = "--- : ---"
    }
  }

}
