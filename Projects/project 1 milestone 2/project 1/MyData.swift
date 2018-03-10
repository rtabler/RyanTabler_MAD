//
//  MyData.swift
//  project 1
//
//  Created by Ryan Tabler on 3/9/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import Foundation
import RealmSwift

class MyData: Object {
    @objc dynamic var favorites = _rlmArray()
}
