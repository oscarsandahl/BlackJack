//
//  Deck.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-02-01.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import Foundation

class Deck {
    //ruter = 10-19, klöver = 20-29, hjärter = 30-39, spader = 40-49
    var cards = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "hJ", "hQ", "hK", "kJ", "kQ", "kK", "rJ", "rQ", "rK", "sJ", "sQ", "sK",]
    var newDeck = [Card]()
    var randomDeckIndex = 0
    var randomCard = " "
    
    func dealCard(player : Player) {
        let size = UInt32(cards.count)
        randomDeckIndex = Int(arc4random_uniform(size))
        randomCard = String(cards[randomDeckIndex])
        switch (cards[randomDeckIndex]) {
        case "11", "21", "31", "41":
            player.pointCount += 1
        case "12", "22", "32", "42":
            player.pointCount += 2
        case "13", "23", "33", "43":
            player.pointCount += 3
        case "14", "24", "34", "44":
            player.pointCount += 4
        case "15", "25", "35", "45":
            player.pointCount += 5
        case "16", "26", "36", "46":
            player.pointCount += 6
        case "17", "27", "37", "47":
            player.pointCount += 7
        case "18", "28", "38", "48":
            player.pointCount += 8
        case "19", "29", "39", "49":
            player.pointCount += 9
        case "hJ", "hQ", "hK", "kJ", "kQ", "kK", "sJ", "sQ", "sK", "rJ", "rQ", "rK", "10", "20", "30", "40":
            player.pointCount += 10
        default:
            print("hoppat ur switch")
        }
        cards.remove(at: randomDeckIndex)
    }
    
    
}
