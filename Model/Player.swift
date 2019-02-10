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
    
    func resetBet() {
        balance += activeBet
        activeBet = 0
    }
    
    func betAllMoney() {
        activeBet += balance
        balance = 0
    }
    
    
    
    
    
}
