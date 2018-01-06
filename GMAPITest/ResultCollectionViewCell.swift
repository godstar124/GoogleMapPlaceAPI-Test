//
//  ResultCollectionViewCell.swift
//  GMAPITest
//
//  Created by ADMIN on 30.06.17.
//  Copyright © 2017 ADMIN. All rights reserved.


import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var coordinatesLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
    
    self.cleanContentInCell()
  }
  
  private func cleanContentInCell() {
    
    addressLabel?.text = ""
    coordinatesLabel?.text = ""
    imageView?.image = nil
  }
  
  override func prepareForReuse() {
    
    super.prepareForReuse()
    
    self.cleanContentInCell()
  }
}
