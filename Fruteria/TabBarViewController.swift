//
//  TabBarViewController.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 14/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, DataStoreOwner {
  
  var dataStore : DataStore? {
    didSet {
      passDataStoreToChildren()
    }
  }
}