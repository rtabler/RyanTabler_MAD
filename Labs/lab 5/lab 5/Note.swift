//
//  Note.swift
//  lab 5
//
//  Created by Ryan Tabler on 3/20/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNote: Object {
    @objc dynamic var noteText: String = ""
}
class FirebaseNote: Decodable {
    var noteText: String = ""
}
