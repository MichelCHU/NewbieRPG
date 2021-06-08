//
//  Player.swift
//  NewbieRPG
//
//  Created by Square on 18/05/2021.
//

import Foundation

class Player {

    static let maxCharacters = 3
    var name: String = ""
    var characters: [Character] = [Character]()
    static var uniqueNames: [String] = [String]()
    var deadCharacters: [Character] = [Character]()
    
    init() {
        name = uniqueName(message: "\nEnter your player name")
        chooseTeam()
    }
    
    func alreadyNameExist(name: String) -> Bool {
        return Player.uniqueNames.contains(name)
    }
    
    func uniqueName(message: String) -> String {
        var name: String
        while true {
            name = FightSystem.userReadLine(message: message)
            if alreadyNameExist(name: name) {
                print(name + " is already taken")
            } else {
                Player.uniqueNames.append(name)
                return name
            }
        }
    }
    
    func chooseTeam() {
        print("\n=== Now " + name + " choose your team ===")
        for _ in 0...Player.maxCharacters-1 {
            characters.append(chooseCharacter())
        }
        printCharacters()
    }

    func chooseCharacter() -> Character {
        while (true) {
            print("\nChoose your character")
            Character.printAllCharacterTypes()
            let choice = readLine()
            switch choice {
                 case "1" :
                    let name = uniqueName(message: "Enter your character name")
                    print("\nMy sword will protect you, DEMACIA ")
                    return Knight(name: name)
                 case "2" :
                    let name = uniqueName(message: "Enter your character name")
                    print("\nTutututuuu , Nobody can see me " )
                    return Thief(name: name)
                 case "3" :
                    let name = uniqueName(message: "Enter your character name")
                    print("\nNo one can escape of my spell, hahahahaha... ")
                    return Mage(name: name)
                 case "4" :
                    let name = uniqueName(message: "Enter your character name")
                    print("\nYou can't escape of my Arrow ")
                    return Hunter(name: name)
                 default :
                     print("\nYou didn't choose a Character, please select a number 1 to 4 ")
            }
        }
    }
 
    func printCharacters() {
        for index in 0...characters.count-1 {
            print ("\n \(index)) \(characters[index].description)")
        }
    }

    
    //============  SYSTEM FIGHT MENU ==================//


    func receiveAttack(damage: Int, target: Character) -> Bool {
        if target.receiveDamage(damage: damage) {
            deadCharacters.append(target)
            characters.remove(at: find(name: target.name))
            return hasAliveTeam()
        } else {
            return false
        }
    }
    
    func hasAliveTeam() -> Bool {
        return deadCharacters.count == Player.maxCharacters
    }
    
    // Trouvez qui meurs et mettre le nom dans la dead character //
    
    func find(name: String) -> Int {
        for index in 0...characters.count-1{
            if name == characters[index].name {
                return index
            }
        }
        return -1
    }
    
}
