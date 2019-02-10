//
//  Marker.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-02-01.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import Foundation

class Marker {
    let markerValue : Int
    
    init(value : Int) {
        markerValue = value
    }
    
    func placingBet() {
        if newPlayer.balance >= markerValue {
            newPlayer.activeBet += markerValue
            newPlayer.balance -= markerValue
        }
    }
    
    
    
    
    
    
}
