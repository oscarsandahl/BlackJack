//
//  ViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-07.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

var activeBet = 0
var playerBalance = 990

class ViewController: UIViewController {

    let blueMarker = 10
    let greenMarker = 50
    let blackMarker = 100
    
    @IBAction func blueMarker(_ sender: UIButton) {
        if playerBalance >= 10 {
            activeBet += blueMarker
            playerBalance -= blueMarker
            updatelabel()
        }
    }
    
    @IBAction func greenMarker(_ sender: UIButton) {
        if playerBalance >= 50 {
            activeBet += greenMarker
            playerBalance -= greenMarker
            updatelabel()
        }
    }
    
    @IBAction func blackMarker(_ sender: UIButton) {
        if playerBalance >= 100 {
            activeBet += blackMarker
            playerBalance -= blackMarker
            updatelabel()
        }
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
        balance.text = String(playerBalance)
        activeBetLabel.text = String(activeBet)
    }
    
    @IBOutlet weak var activeBetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //activeBetLabel.text = String(activeBet)
        activeBetLabel.text = "0"
        balance.text = String(playerBalance)
    }
    
    func updatelabel() {
        activeBetLabel.text = String(activeBet)
        balance.text = String(playerBalance)
//      print(activeBet)
    }

}

