//
//  ViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-07.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

var newPlayer = Player()
var theDealer = Dealer()
var myDeck = Deck()

class ViewController: UIViewController {
    
    let blueMarker = Marker(value: 10)
    let greenMarker = Marker(value: 50)
    let blackMarker = Marker(value: 100)
    
    @IBAction func blueMarker(_ sender: UIButton) {
        blueMarker.placingBet()
        updatelabel()
    }
    
    @IBAction func greenMarker(_ sender: UIButton) {
        greenMarker.placingBet()
        updatelabel()
    }
    
    @IBAction func blackMarker(_ sender: UIButton) {
        blackMarker.placingBet()
        updatelabel()
    }
    
    @IBAction func allMoney(_ sender: UIButton) {
        newPlayer.betAllMoney()
        updatelabel()
    }
    
    @IBOutlet weak var balance: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        newPlayer.resetBet()
        updatelabel()
    }
    
    @IBOutlet weak var activeBetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDeck = Deck()
        newPlayer.activeBet = 0
        newPlayer.pointCount = 0
        newPlayer.cardCount = 0
        theDealer.pointCount = 0
        theDealer.cardCount = 0
        updatelabel()
    }
    
    func updatelabel() {
        activeBetLabel.text = String(newPlayer.activeBet)
        balance.text = String("$\(newPlayer.balance)")
    }

}

