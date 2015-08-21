//
//  ProductViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var detailsLabel: MultilineLabelThatWorks!
  @IBOutlet weak var priceLabel: UILabel!
  
  
  
  var product: Product? {
    didSet {
      updateViewForProduct()
      
    }
    
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      updateViewForProduct()

        // Do any additional setup after loading the view.
    }

  
  private func updateViewForProduct() {
    if let product = product {
      productImageView?.image = UIImage(named: product.photoName)
      nameLabel?.text = product.name
      detailsLabel?.text = product.details
      priceLabel?.text = "€\(product.price)"
    }
  }
  
  
    

}
