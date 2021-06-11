//
//  Chest.swift
//  NewbieRPG
//
//  Created by Square on 04/06/2021.
//

import Foundation

public class Chest {
    

    internal static func chest(system: FightSystem) -> Bool{

        print("\nyou found a chest")        
        let dice:Int = Int.random(in: 0...1)
        switch dice {
        case 0:
            chestWeapon(system: system)
        case 1:
            chestItem()
        default:
            print("error")
        }
        return false
    }
    
    private static func chestWeapon(system: FightSystem) {
        let randomWeapon:Weapon = Weapon()
        let currentPlayer:Player = system.players[system.currentPlayer]
        let selectedCharacter = currentPlayer.characters[currentPlayer.characters.count-1]
            selectedCharacter.weapon = randomWeapon
        print("\nThe chest contains: " + randomWeapon.weaponName + " : " + randomWeapon.damage.description + " ATK")
        print("You gave it to " + selectedCharacter.name)
    }
    
    private static func chestItem() {
        print("\nYou found a broken potion")
        print("Turn skipped")
    }
}
