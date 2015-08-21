//
//  ProductTableViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 12/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController, DataStoreOwner {
  
  var dataStore : DataStore? {
    didSet {
      tableView.reloadData()
    }
  }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 120
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return dataStore?.products.count ?? 0
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
    
    if let cell = cell as? ProductTableViewCell {
      cell.product = dataStore?.products[indexPath.row]
    }
    
    return cell
  }

    
  // MARK: - Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destVC = segue.destinationViewController as? ProductViewController {
      let selectedRow = tableView.indexPathForSelectedRow?.row ?? 0
      destVC.product = dataStore?.products[selectedRow]
    }
  }
 
  
  
  

}

