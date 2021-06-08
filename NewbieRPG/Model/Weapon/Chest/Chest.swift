//
//  Chest.swift
//  NewbieRPG
//
//  Created by Square on 04/06/2021.
//

import Foundation

class Chest {
    
    static func chest(system: FightSystem) -> Bool{
        let dice:Int = Int.random(in: 0...1)
        print("\nyou found a chest")
        switch dice {
        case 0:
            chestWeapon(system: system)
        case 1:
            chestItem(system: system)
        default:
            print("error")
        }
        return false
    }
    
    static func chestWeapon(system: FightSystem) {
        let randomWeapon:Weapon = Weapon()
        let currentPlayer:Player = system.players[system.currentPlayer]
        let selectedCharacter = currentPlayer.characters[Int.random(in: 0...currentPlayer.characters.count-1)]
            selectedCharacter.weapon = randomWeapon
        print("\nThe chest contains: " + randomWeapon.weaponName + ":" + randomWeapon.damage.description + " ATK")
        print("You gave it to " + selectedCharacter.name)
    }
    
   static func chestItem(system: FightSystem) {
        print("\nYou found a broken potion")
        print("Turn skipped")
    }
}
