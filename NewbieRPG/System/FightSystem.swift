//
//  systemFight.swift
//  NewbieRPG
//
//  Created by Square on 18/05/2021.
//

import Foundation

class FightSystem {
    
    let maxPlayer = 99
    let maxTurn = 99
    var curTurn = 0
    var currentPlayer = 0
    var players = [Player]()
    var deadPlayers: [Player] = [Player]()
    
    
    func startGame() {
        print("==========================="
            + "\n   Welcome to NewbieRPG   "
            + "\n===========================")
        
        initPlayers()
        gameLoop()
    }

    static func userReadLine(message: String) -> String {
        print(message)
        let line = readLine()
        if line == nil {
            return userReadLine(message: message)
        } else {
            return line!
        }
    }
    
    static func userReadNumber(message: String) -> Int {
        while true {
            let number = Int(FightSystem.userReadLine(message: message))
            if number != nil {
                return number!
            } else {
                print("\nit's not possible ")
            }
        }
    }
    
    func userReadNumberPlayer(message: String) -> Int {
        while true {
            let numberMaxPlayer = FightSystem.userReadNumber(message: message)
            if numberMaxPlayer < maxPlayer && numberMaxPlayer > 1{
                //print("\(numberMaxPlayer) players is selected")
                return numberMaxPlayer
            } else {
                print("\n\(numberMaxPlayer) is not possible")
            }
        }
    }
    
    func initPlayers() {
        let numberPlayer = userReadNumberPlayer(message: "\nEnter the number of players")
        print("\n\(numberPlayer) Players will play")
        
        while true {
            players.append(Player())
            if players.count == numberPlayer {
                break
            }
        }
        printPlayersBoards()
    }
    
    func printPlayersBoards() {
        for player in players {
            print("\n=== " + " Team of player" + player.name + " ===")
            player.printCharacters()
        }
    }
            // =========    FIGHT MENU      ======= //
   

    // ========== Choose Player and Character system ======== //
    
    func orderAttack() -> Bool{
        print("\nChoose the target player")
        let attackedPlayer = playerChooseTargetPlayer()
        print("\nChoose the character to attack")
        let attackingCharacter = playerChooseTargetCharacter(player: players[currentPlayer])
        print("\nChoose a character to attack")
        let attackedCharacter = playerChooseTargetCharacter(player: attackedPlayer)
        
        print(players[currentPlayer].name + ":" +  players[currentPlayer].characters.count.description + " vs " + attackedPlayer.name + ":" + attackedPlayer.characters.count.description)
        print("\n" + attackingCharacter.description + "\n== vs ==\n" + attackedCharacter.description)
        
        let totalDamage = attackingCharacter.attack + attackingCharacter.weapon.damage
        let playerIsDead = attackedPlayer.receiveAttack(damage: totalDamage, target: attackedCharacter)
        if playerIsDead {
            killedPlayer(target: attackedPlayer)
            print("\nThe player " + attackedPlayer.name + " lost ")
            return true
        } else {
            return false
        }
    }
    
    func playerChooseTargetPlayer() -> Player {
        for index in 0...players.count-1{
            if index != currentPlayer {
                print(index.description + ")" + players[index].name)
            }
        }
        while true {
            let indexPlayer = FightSystem.userReadNumber(message: "\nEnter a number")
            if indexPlayer < players.count && indexPlayer > -1 && indexPlayer != currentPlayer{
                return players[indexPlayer]
            } else {
                print("\n\(indexPlayer) is not possible")
            }
        }
    }
    
    func playerChooseTargetCharacter(player: Player) -> Character {
        for index in 0...player.characters.count-1{
            print(index.description + ")" + player.characters[index].name)
        }
        while true {
            let index = FightSystem.userReadNumber(message: "\nEnter a number")
            if -1  < index && index < player.characters.count {
                return player.characters[index]
            } else {
                print("\n\(index) is not possible")
            }
        }
    }
     
    
    func findPlayer(name: String) -> Int {
        for index in 0...players.count-1 {
            if name == players[index].name{
                return index
            }
        }
        return -1
    }
    
    func killedPlayer(target: Player){
            deadPlayers.append(target)
            players.remove(at: findPlayer(name: target.name))
    }
    
    func battleReadLine() -> String {
        if let line = readLine(){
            return line
        } else {
            return ""
        }
    }
    
    // ====== System Turn and Gameover ======= //
    
    // menu dira true si un joueur meurs 
    func menu() -> Bool{
        while true {
            print("\nBattle System"
                    + "\n1. Attack"
                    + "\n2. Search chest")
 //                   + "\n3. Scan")
            let action = battleReadLine()
            
            switch action {
            case "1": return orderAttack()
            case "2": return Chest.chest(system: self)
  //          case "3": return orderAttack()
            default:
                print("choose a correct number")
            }
        }
    }

    
    // turn rappel true des qu'un player meurt
    
    func turn(player: Player) -> Bool{
        print("\nTurn " + "\(curTurn)")
        print("Player turn to play : \(players[currentPlayer].name)")
        return menu()
    }
    
    func nextPlayer() {
        currentPlayer += 1
        currentPlayer %= players.count
    }
    
    func isTimeOut() -> Bool {
        if curTurn + 1 > maxTurn {
            print ("\nTime out")
            return true
        }
        else {
            return false
        }
    }
    
    func isGameOver() -> Bool {
        if players.count == 1 {
            print("\nGame is over")
            return true
        } else {
            return false
        }
    }
    
   func gameLoop() {
        while !isTimeOut() {
            curTurn += 1
            if turn(player: players[currentPlayer]) {
                if isGameOver() {
                    print("\nThe winner is the player " + players[currentPlayer].name)
                    return
                }
            }
            nextPlayer()
        }
    }
    
}
