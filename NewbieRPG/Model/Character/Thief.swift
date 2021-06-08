//
//  Thieft.swift
//  NewbieRPG
//
//  Created by Square on 22/05/2021.
//

import Foundation

class Thief: Character {
    init(name: String) {
        super.init(type: .Thief, name: name, health: 180, attack: 35, weapon: Dagger())
    }
}
