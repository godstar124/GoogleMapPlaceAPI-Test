//
//  ResultsAPIVC.swift
//  GMAPITest
//
//  Created by ADMIN on 30.06.17.
//  Copyright © 2017 ADMIN. All rights reserved.
//

import UIKit

class ResultsAPIVC: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var results : Array<Any>!
  
  override func viewDidLoad() {
  
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    
    self.collectionView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }
  
  func setResultsData(_ resultsArray : Array<Any>) {
    
    self.results = resultsArray
    
  }

}

extension ResultsAPIVC : UICollectionViewDataSource {
  

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return self.results.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCollectionCellID", for: indexPath) as! ResultCollectionViewCell
    
    let result = self.results[indexPath.row] as! NSDictionary
    
    cell.addressLabel.text = result["formatted_address"] as? String
    
    let geometry = result["geometry"] as? NSDictionary
    let location = geometry?["location"] as? NSDictionary
    
    cell.coordinatesLabel.text = "\((location?["lat"])!):\((location?["lng"])!)"
    
    return cell
  }
  

}
