//
//  secondViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-12.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

var segueMessage = 0

class secondViewController: UIViewController {

    var player_Count = 0
    var card_count = 0
    var dealer_Count = 0
    var dealer_cardCount = 0
    //ruter = 10-19, klöver = 20-29, hjärter = 30-39, spader = 40-49
    var myDeck = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "hJ", "hQ", "hK", "kJ", "kQ", "kK", "rJ", "rQ", "rK", "sJ", "sQ", "sK",]
    var randomDeckIndex = 0
    
    @IBOutlet weak var activeBetLabel: UILabel!
    @IBOutlet weak var playerCount: UILabel!
    @IBOutlet weak var dealerCount: UILabel!
    
    @IBAction func dealButton(_ sender: UIButton) {
        deal()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        while dealer_Count < 22 {
            dealer_deal()
            if dealer_Count > 21 {
                win()
                break
            } else if dealer_Count > player_Count && dealer_Count < 22 {
                loose()
                break
            } else if dealer_Count == player_Count {
                draw()
                break
            }
        }
    }
    
    @IBOutlet weak var playerFirstCard: UIImageView!
    @IBOutlet weak var playerSecondCard: UIImageView!
    @IBOutlet weak var playerThirdCard: UIImageView!
    @IBOutlet weak var playerFourthCard: UIImageView!
    @IBOutlet weak var playerFifthCard: UIImageView!
    
    @IBOutlet weak var dealerFirstCard: UIImageView!
    @IBOutlet weak var dealerSecondCard: UIImageView!
    @IBOutlet weak var dealerThirdCard: UIImageView!
    @IBOutlet weak var dealerFourthCard: UIImageView!
    @IBOutlet weak var dealerFifthCard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeBetLabel.text = String(activeBet)
        playerCount.text = String(player_Count)
        dealerCount.text = String(dealer_Count)
        hide_cards()
        deal()
        deal()
        dealer_deal()
    }
    
    func hide_cards() {
        playerFirstCard.isHidden = true
        playerSecondCard.isHidden = true
        playerThirdCard.isHidden = true
        playerFourthCard.isHidden = true
        playerFifthCard.isHidden = true
        dealerThirdCard.isHidden = true
        dealerFourthCard.isHidden = true
        dealerFifthCard.isHidden = true
    }
    
    func deal() {
        let size = UInt32(myDeck.count)
        randomDeckIndex = Int(arc4random_uniform(size))
        displayCard()
        pointCalculator()
        myDeck.remove(at: randomDeckIndex)
        if player_Count > 21 {
            loose()
        }
    }
    
    func win() {
        activeBet *= 2
        playerBalance += activeBet
        activeBetLabel.text = String(activeBet)
        segueMessage = 1
        pushSegue()
        print("spelare har vunnit")
    }
    
    func loose() {
        segueMessage = 3
        activeBetLabel.text = String(activeBet)
        pushSegue()
        print("spelare har förlorat")
    }
    
    func draw() {
        segueMessage = 2
        playerBalance += activeBet
        pushSegue()
        print("lika")
    }
    
    func pushSegue() {
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.3, execute: {
            self.performSegue(withIdentifier: "resultSegue", sender: self)
        })
    }
    
    func displayCard() {
        switch card_count {
        case 0:
            playerFirstCard.image = UIImage(named: myDeck[randomDeckIndex])
            playerFirstCard.isHidden = false
        case 1:
            playerSecondCard.image = UIImage(named: myDeck[randomDeckIndex])
            playerSecondCard.isHidden = false
        case 2:
            playerThirdCard.image = UIImage(named: myDeck[randomDeckIndex])
            playerThirdCard.isHidden = false
        case 3:
            playerFourthCard.image = UIImage(named: myDeck[randomDeckIndex])
            playerFourthCard.isHidden = false
        case 4:
            playerFifthCard.image = UIImage(named: myDeck[randomDeckIndex])
            playerFifthCard.isHidden = false
        default:
            print("Något oväntat hände i switchen")
        }
        card_count += 1
    }
    
    func pointCalculator() {
        switch (myDeck[randomDeckIndex]) {
        case "11", "21", "31", "41":
            player_Count += 1
        case "12", "22", "32", "42":
            player_Count += 2
        case "13", "23", "33", "43":
            player_Count += 3
        case "14", "24", "34", "44":
            player_Count += 4
        case "15", "25", "35", "45":
            player_Count += 5
        case "16", "26", "36", "46":
            player_Count += 6
        case "17", "27", "37", "47":
            player_Count += 7
        case "18", "28", "38", "48":
            player_Count += 8
        case "19", "29", "39", "49":
            player_Count += 9
        case "hJ", "hQ", "hK", "kJ", "kQ", "kK", "sJ", "sQ", "sK", "rJ", "rQ", "rK", "10", "20", "30", "40":
            player_Count += 10
        default:
            print("hoppat ur switch")
        }
        playerCount.text = String(player_Count)
    }
    
    //Dealer
    func dealer_deal() {
        let size = UInt32(myDeck.count)
        randomDeckIndex = Int(arc4random_uniform(size))
        dealer_displayCard()
        dealer_pointCalculator()
        myDeck.remove(at: randomDeckIndex)
    }
    
    func dealer_displayCard() {
        switch dealer_cardCount {
        case 0:
            dealerFirstCard.image = UIImage(named: myDeck[randomDeckIndex])
            dealerFirstCard.isHidden = false
        case 1:
            dealerSecondCard.image = UIImage(named: myDeck[randomDeckIndex])
            dealerSecondCard.isHidden = false
        case 2:
            dealerThirdCard.image = UIImage(named: myDeck[randomDeckIndex])
            dealerThirdCard.isHidden = false
        case 3:
            dealerFourthCard.image = UIImage(named: myDeck[randomDeckIndex])
            dealerFourthCard.isHidden = false
//        case 4:
//            playerFifthCard.image = UIImage(named: myDeck[randomDeckIndex])
//            playerFifthCard.isHidden = false
        default:
            print("Något oväntat hände i switchen")
        }
        dealer_cardCount += 1
    }
    
    func dealer_pointCalculator() {
        switch (myDeck[randomDeckIndex]) {
        case "11", "21", "31", "41":
            dealer_Count += 1
        case "12", "22", "32", "42":
            dealer_Count += 2
        case "13", "23", "33", "43":
            dealer_Count += 3
        case "14", "24", "34", "44":
            dealer_Count += 4
        case "15", "25", "35", "45":
            dealer_Count += 5
        case "16", "26", "36", "46":
            dealer_Count += 6
        case "17", "27", "37", "47":
            dealer_Count += 7
        case "18", "28", "38", "48":
            dealer_Count += 8
        case "19", "29", "39", "49":
            dealer_Count += 9
        case "hJ", "hQ", "hK", "kJ", "kQ", "kK", "sJ", "sQ", "sK", "rJ", "rQ", "rK", "10", "20", "30", "40":
            dealer_Count += 10
        default:
            print("hoppat ur switch")
        }
        dealerCount.text = String(dealer_Count)
    }
    
    
    
    
}
