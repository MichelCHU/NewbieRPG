//
//  Knight.swift
//  NewbieRPG
//
//  Created by Square on 22/05/2021.
//

import Foundation

class Knight: Character {
    init(name: String) {
        super.init(type: .Knight, name: name, health: 280, attack: 300, weapon: Sword())
    }
}
