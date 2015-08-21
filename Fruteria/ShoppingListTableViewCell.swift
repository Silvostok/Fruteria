//
//  ShoppingListTableViewCell.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 15/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var itemCountLabel: UILabel!
  
  
  private static var dateFormatter : NSDateFormatter = {
    let df = NSDateFormatter()
    df.dateStyle = .ShortStyle
    return df
    }()
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    nameLabel.layoutMargins = UIEdgeInsetsZero
    dateLabel.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0)
  }
  
  var shoppingList : ShoppingList? {
    didSet {
      if let shoppingList = shoppingList {
        nameLabel?.text = shoppingList.name
        itemCountLabel?.text = "\(shoppingList.products.count) unidades"
        dateLabel?.text = self.dynamicType.dateFormatter.stringFromDate(shoppingList.date)
      }
    }
  }
  
  
  
  
  
  
  
}
