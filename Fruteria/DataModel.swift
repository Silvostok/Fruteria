//
//  DataModel.swift
//  Fruteria
//
//  Created by Miguel Angel Rubio Caballero on 12/08/15.
//  Copyright © 2015 MiguelRubio. All rights reserved.
//

import Foundation

protocol Serializable {
  
  init?(dict: [String : AnyObject])
  
  static func fromDictArray(array: [[String : AnyObject]]) -> [Self]?
  
  var dictRepresentation : [String : AnyObject] { get }
  
}

extension Serializable {
  static func fromDictArray(array: [[String : AnyObject]]) -> [Self]? {
    return array.flatMap { Self(dict: $0) }
  }
}

