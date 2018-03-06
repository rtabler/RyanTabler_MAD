//
//  Petition.swift
//  lab 4
//
//  Created by Ryan Tabler on 3/5/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import Foundation

struct Petition: Decodable {
   let title: String
   let sigCount : Int
   let url : String
}

