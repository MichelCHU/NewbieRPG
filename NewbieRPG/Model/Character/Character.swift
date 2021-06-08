//
//  Character.swift
//  NewbieRPG
//
//  Created by Square on 18/05/2021.
//

import Foundation

class Character {
    
    var type:CharacterType
    var name:String
    var health:Int
    var attack:Int
    var weapon:Weapon
    var isAlive: Bool = true
    
    enum CharacterType : Int, CustomStringConvertible, CaseIterable {
        case Knight = 1, Thief = 2, Mage = 3, Hunter = 4
        
        var description: String {
            switch self {
                case .Knight: return "Knight"
                case .Thief: return "Thief"
                case .Mage: return "Mage"
                case .Hunter: return "Hunter"
            }
        }
    }
    
    static func intToType(chiffre: Int) -> CharacterType {
        let optionel = CharacterType.init(rawValue: chiffre)
        if optionel != nil {
            return CharacterType.init(rawValue: chiffre)!
        } else {
            return CharacterType.Knight
        }
    }
    
    // contructor Characters for print and choose
    
    init(type:CharacterType, name:String, health:Int, attack:Int, weapon:Weapon) {
        self.type = type
        self.name = name
        self.health = health
        self.attack = attack
        self.weapon = weapon
    }

    var description: String {
        return type.description + "(Name: " + self.name + "  HP: ❤︎ " + self.health.description + "  ATK: ⚒︎ " + self.attack.description + self.weapon.description + ")"
    }
    
    static func printAllCharacterTypes() {
        let size = CharacterType.allCases.count
        for index in 1...size {
                print ("\(index)) \(intToType(chiffre: index))")
        }
    }
    
    func receiveDamage(damage: Int) -> Bool {
        print("\nThe character " + self.name + " lost " + "\(damage) Hp")
        health -= damage
        if health <= 0{
            print("\n☠️ The character " + self.name + " is dead")
            return true
        } else {
            return false
        }
    }
    
}

