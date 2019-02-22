//
//  Card.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-02-05.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import Foundation

class Card {
    let suit : String
    let name : String
    var value : Int
    
    init(cardSuit : String, cardName : String, cardValue : Int) {
        suit = cardSuit
        name = cardName
        value = cardValue
    }
    
    func getCardName() -> String {
        return name
    }
    
    func getCardValue() ->  Int {
        return value
    }
    
    func setValue(cardValue : Int) {
        value = cardValue
    }
    
    
}
