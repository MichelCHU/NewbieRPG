//
//  Hunter.swift
//  NewbieRPG
//
//  Created by Square on 22/05/2021.
//

import Foundation

public class Hunter: Character {
    init(name: String) {
        super.init(type: .Hunter, name: name, health: 150, attack: 50, weapon: Bow())
    }
}
