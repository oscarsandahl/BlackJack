//
//  ViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-07.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blueMarker = 10
    let greenMarker = 50
    let blackMarker = 100
    
    var playerBalance = 990
    
    var activeBet = 0
    
    @IBAction func blueMarker(_ sender: UIButton) {
        activeBet += blueMarker
        playerBalance -= blueMarker
        activeBetLabel.text = String(activeBet)
        balance.text = String(playerBalance)
        print(activeBet)
    }
    
    @IBAction func greenMarker(_ sender: UIButton) {
        activeBet += greenMarker
        playerBalance -= greenMarker
        activeBetLabel.text = String(activeBet)
        balance.text = String(playerBalance)
        print(activeBet)
    }
    
    @IBAction func blackMarker(_ sender: UIButton) {
        activeBet += blackMarker
        playerBalance -= blackMarker
        activeBetLabel.text = String(activeBet)
        balance.text = String(playerBalance)
        print(activeBet)
    }
    
    @IBAction func allMoney(_ sender: UIButton) {
        activeBet += playerBalance
        playerBalance = 0
        print("balansen är nu \(playerBalance)")
        print("bettet är \(activeBet)")
        balance.text = String(playerBalance)
        activeBetLabel.text = String(activeBet)
    }
    
    @IBOutlet weak var balance: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        playerBalance += activeBet
        activeBet = 0
        balance.text = String(playerBalance)
        activeBetLabel.text = String(activeBet)
        print(activeBet)
    }
    
    @IBOutlet weak var activeBetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //activeBetLabel.text = String(activeBet)
        activeBetLabel.text = "0"
        balance.text = String(playerBalance)
    }
    
    func ettnamn() {
        
    }


}

