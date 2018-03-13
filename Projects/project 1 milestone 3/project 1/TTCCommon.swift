//
//  TTCCommon.swift
//  project 1
//
//  Created by Ryan Tabler on 3/13/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import Foundation

class TTCCommon {
    func translatorCodeToShortname(translator: String) -> String {
        if translator == "Mitchell" {
            return "Mitchell"
        } else if translator == "FengEnglish" {
            return "Feng/English"
        } else {
            return ""
        }
    }
    func translatorCodeToLongName(translator: String) -> String {
        if translator == "Mitchell" {
            return "Stephen Mitchell"
        } else if translator == "FengEnglish" {
            return "Gia-Fu Feng and Jane English"
        } else {
            return ""
        }
    }
}
