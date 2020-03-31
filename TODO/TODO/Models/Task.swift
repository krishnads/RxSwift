//
//  Task.swift
//  TODO
//
//  Created by Krishna Datt Shukla on 18/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}



struct Task {
    let title: String
    let priority: Priority
}
