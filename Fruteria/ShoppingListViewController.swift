//
//  ShoppingListViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 15/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var nameLabel: MultilineLabelThatWorks!
  @IBOutlet weak var dateLabel: MultilineLabelThatWorks!
  @IBOutlet weak var totalCostLabel: UILabel!
  
  
  var dataStore : DataStore?
  var shoppingList : ShoppingList? {
    didSet {
      updateViewForShoppingList()
    }
  }
  
  private static var dateFormatter : NSDateFormatter = {
    let df = NSDateFormatter()
    df.dateStyle = .ShortStyle
    return df
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    configureTableView(tableView)
    updateViewForShoppingList()
  }
}

extension ShoppingListViewController {
  private func updateViewForShoppingList() {
    if let shoppingList = shoppingList {
      nameLabel?.text = shoppingList.name
      dateLabel?.text = self.dynamicType.dateFormatter.stringFromDate(shoppingList.date)
      totalCostLabel?.text = "€\(shoppingList.products.reduce(0){ $0 + $1.price })"
    }
    tableView?.reloadData()
  }
  
  private func configureTableView(tableView: UITableView) {
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
    tableView.dataSource = self
    tableView.backgroundColor = UIColor.clearColor()
    tableView.backgroundView?.backgroundColor = UIColor.clearColor()
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
    tableView.separatorStyle = .None
  }
}


extension ShoppingListViewController : UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingList?.products.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
    if let cell = cell as? ProductTableViewCell {
      cell.product = shoppingList?.products[indexPath.row]
    }
    cell.backgroundView?.backgroundColor = UIColor.clearColor()
    cell.backgroundColor = UIColor.clearColor()
    cell.contentView.backgroundColor = UIColor.clearColor()
    return cell
  }
}


