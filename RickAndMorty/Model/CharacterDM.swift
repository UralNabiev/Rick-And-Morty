//
//  CharacterDM.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 17/01/23.
//

import SwiftyJSON
import UIKit

struct CharacterDM {
    
    var name: String
    var imgCharacter: String
    var statusCharacter: String
    var statusColor: String
    var lastLocation: String
    var firstSeen: String
    var url: String
    
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.imgCharacter = json["image"].stringValue
        self.statusCharacter = json["status"].stringValue
        self.statusColor = json["status"].stringValue
        self.lastLocation = json["location"]["name"].stringValue
        self.firstSeen = json["gender"].stringValue
        self.url = json["url"].stringValue
    }
}
