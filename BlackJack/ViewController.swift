//
//  ViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-07.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

var activeBet = 0
var playerBalance = 1000

class ViewController: UIViewController {

    let blueMarker = 10
    let greenMarker = 50
    let blackMarker = 100
    
    @IBAction func blueMarker(_ sender: UIButton) {
        placingBet(markerValue: blueMarker)
    }
    
    @IBAction func greenMarker(_ sender: UIButton) {
        placingBet(markerValue: greenMarker)
    }
    
    @IBAction func blackMarker(_ sender: UIButton) {
        placingBet(markerValue: blackMarker)
    }
    
    @IBAction func allMoney(_ sender: UIButton) {
        activeBet += playerBalance
        playerBalance = 0
        updatelabel()
    }
    
    @IBOutlet weak var balance: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        playerBalance += activeBet
        activeBet = 0
        updatelabel()
    }
    
    @IBOutlet weak var activeBetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatelabel()
    }
    
    func updatelabel() {
        activeBetLabel.text = String(activeBet)
        balance.text = String("$\(playerBalance)")
    }
    
    func placingBet(markerValue : Int) {
        if playerBalance >= markerValue {
            activeBet += markerValue
            playerBalance -= markerValue
            updatelabel()
        }
    }

}

