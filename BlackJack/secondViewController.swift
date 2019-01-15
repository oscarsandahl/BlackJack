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
        performSegue(withIdentifier: "resultSegue", sender: self)
        print("spelare har vunnit")
    }
    
    func loose() {
        segueMessage = 3
        activeBetLabel.text = String(activeBet)
        performSegue(withIdentifier: "resultSegue", sender: self)
        print("spelare har förlorat")
    }
    
    func draw() {
        segueMessage = 2
        playerBalance += activeBet
        performSegue(withIdentifier: "resultSegue", sender: self)
        print("lika")
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
        case "10":
            player_Count += 10
        case "11":
            player_Count += 1
        case "12":
            player_Count += 2
        case "13":
            player_Count += 3
        case "14":
            player_Count += 4
        case "15":
            player_Count += 5
        case "16":
            player_Count += 6
        case "17":
            player_Count += 7
        case "18":
            player_Count += 8
        case "19":
            player_Count += 9
        case "20":
            player_Count += 10
        case "21":
            player_Count += 1
        case "22":
            player_Count += 2
        case "23":
            player_Count += 3
        case "24":
            player_Count += 4
        case "25":
            player_Count += 5
        case "26":
            player_Count += 6
        case "27":
            player_Count += 7
        case "28":
            player_Count += 8
        case "29":
            player_Count += 9
        case "30":
            player_Count += 10
        case "31":
            player_Count += 1
        case "32":
            player_Count += 2
        case "33":
            player_Count += 3
        case "34":
            player_Count += 4
        case "35":
            player_Count += 5
        case "36":
            player_Count += 6
        case "37":
            player_Count += 7
        case "38":
            player_Count += 8
        case "39":
            player_Count += 9
        case "40":
            player_Count += 10
        case "41":
            player_Count += 1
        case "42":
            player_Count += 2
        case "43":
            player_Count += 3
        case "44":
            player_Count += 4
        case "45":
            player_Count += 5
        case "46":
            player_Count += 6
        case "47":
            player_Count += 7
        case "48":
            player_Count += 8
        case "49":
            player_Count += 9
        case "hJ":
            player_Count += 10
        case "hQ":
            player_Count += 10
        case "hK":
            player_Count += 10
        case "kJ":
            player_Count += 10
        case "kQ":
            player_Count += 10
        case "kK":
            player_Count += 10
        case "sJ":
            player_Count += 10
        case "sQ":
            player_Count += 10
        case "sK":
            player_Count += 10
        case "rJ":
            player_Count += 10
        case "rQ":
            player_Count += 10
        case "rK":
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
        case "10":
            dealer_Count += 10
        case "11":
            dealer_Count += 1
        case "12":
            dealer_Count += 2
        case "13":
            dealer_Count += 3
        case "14":
            dealer_Count += 4
        case "15":
            dealer_Count += 5
        case "16":
            dealer_Count += 6
        case "17":
            dealer_Count += 7
        case "18":
            dealer_Count += 8
        case "19":
            dealer_Count += 9
        case "20":
            dealer_Count += 10
        case "21":
            dealer_Count += 1
        case "22":
            dealer_Count += 2
        case "23":
            dealer_Count += 3
        case "24":
            dealer_Count += 4
        case "25":
            dealer_Count += 5
        case "26":
            dealer_Count += 6
        case "27":
            dealer_Count += 7
        case "28":
            dealer_Count += 8
        case "29":
            dealer_Count += 9
        case "30":
            dealer_Count += 10
        case "31":
            dealer_Count += 1
        case "32":
            dealer_Count += 2
        case "33":
            dealer_Count += 3
        case "34":
            dealer_Count += 4
        case "35":
            dealer_Count += 5
        case "36":
            dealer_Count += 6
        case "37":
            dealer_Count += 7
        case "38":
            dealer_Count += 8
        case "39":
            dealer_Count += 9
        case "40":
            dealer_Count += 10
        case "41":
            dealer_Count += 1
        case "42":
            dealer_Count += 2
        case "43":
            dealer_Count += 3
        case "44":
            dealer_Count += 4
        case "45":
            dealer_Count += 5
        case "46":
            dealer_Count += 6
        case "47":
            dealer_Count += 7
        case "48":
            dealer_Count += 8
        case "49":
            dealer_Count += 9
        case "hJ":
            dealer_Count += 10
        case "hQ":
            dealer_Count += 10
        case "hK":
            dealer_Count += 10
        case "kJ":
            dealer_Count += 10
        case "kQ":
            dealer_Count += 10
        case "kK":
            dealer_Count += 10
        case "sJ":
            dealer_Count += 10
        case "sQ":
            dealer_Count += 10
        case "sK":
            dealer_Count += 10
        case "rJ":
            dealer_Count += 10
        case "rQ":
            dealer_Count += 10
        case "rK":
            dealer_Count += 10
        default:
            print("hoppat ur switch")
        }
        dealerCount.text = String(dealer_Count)
    }
    
    
    
    
}
