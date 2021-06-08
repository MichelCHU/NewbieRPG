//
//  Mage.swift
//  NewbieRPG
//
//  Created by Square on 22/05/2021.
//

import Foundation

class Mage: Character {
    init(name: String) {
        super.init(type: .Mage, name: name, health: 120, attack: 20, weapon: Rod())
    }
}
