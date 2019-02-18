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
        updateUI()
    }
    @IBAction func greenMarker(_ sender: UIButton) {
        greenMarker.placingBet()
        updateUI()
    }
    @IBAction func blackMarker(_ sender: UIButton) {
        blackMarker.placingBet()
        updateUI()
    }
    @IBAction func allMoney(_ sender: UIButton) {
        newPlayer.betAllMoney()
        updateUI()
    }
    @IBAction func reset(_ sender: UIButton) {
        newPlayer.resetBet()
        updateUI()
    }
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var activeBetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValues()
        updateUI()
    }
    
    func updateUI() {
        activeBetLabel.text = String(newPlayer.activeBet)
        balance.text = String("$\(newPlayer.balance)")
    }
    
    func resetValues() {
        myDeck = Deck()
        newPlayer.reset()
        theDealer.reset()
    }

}

