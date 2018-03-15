//
//  Restaurant.swift
//  midterm
//
//  Created by Ryan Tabler on 3/15/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import Foundation
import RealmSwift

class Restaurant: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
}
