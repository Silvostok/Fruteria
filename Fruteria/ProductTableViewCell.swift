//
//  ProductTableViewCell.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  
  var product : Product? {
    didSet {
      if let product = product {
        nameLabel?.text = product.name
        productImageView?.image = UIImage(named: "\(product.photoName)_thumb")
      }
    }
  }
  

}
