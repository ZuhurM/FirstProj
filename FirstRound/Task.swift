//
//  Task.swift
//  FirstRound
//
//  Created by Zuhur M on 03.06.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import Foundation
class Task {
  let name: String
  let creationDate = Date()
  var completed = false
  
  init(name: String) {
    self.name = name
  }
}
