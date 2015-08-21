//
//  SelectableProductTableViewCell.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 17/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class SelectableProductTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var checkBoxLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  
  

  var product : Product? {
    didSet {
      nameLabel?.text = product?.name
    }
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
    checkBoxLabel?.text = selected ? "✅" : " "
  }

}
