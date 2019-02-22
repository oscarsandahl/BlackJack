//
//  Player.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-02-01.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import Foundation

class Player {
    var balance = 1000
    var activeBet = 0
    var pointCount = 0
    var cardCount = 0
    var hand = [Card]()
    
    func resetBet() {
        balance += activeBet
        activeBet = 0
    }
    
    func betAllMoney() {
        activeBet += balance
        balance = 0
    }
    
    func addCardToHand(anyCard : Card) {
        hand.append(anyCard)
        cardCount += 1
        pointCount += anyCard.getCardValue()
    }
    
    func reset() {
        activeBet = 0
        pointCount = 0
        cardCount = 0
        newPlayer.hand.removeAll()
    }
    
}

