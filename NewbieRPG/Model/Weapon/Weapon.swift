//
//  Weapon.swift
//  NewbieRPG
//
//  Created by Square on 21/05/2021.
//

import Foundation


public class Weapon {
    var damage: Int
    var weaponName: String
    private let uniqueWeaponName: [String] = ["Sword","Dagger","Rod","Bow","Flamberge","Damacus","Staff","Long Bow","Rusty Sword","Rusty Dagger","Rotten Rod","broken Bow"]
    
    init(damage: Int, weaponName: String) {
        self.damage = damage
        self.weaponName = weaponName
    }
    
    init() {
        self.weaponName = uniqueWeaponName.randomElement()!
        self.damage = Int.random(in: 20...70)
    }
    
    var description: String {
        return "(Weapon equiped " + weaponName + " : " + damage.description + " ATK "  + ")"
    }
}

