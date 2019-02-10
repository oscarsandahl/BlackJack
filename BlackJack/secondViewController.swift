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
    
    @IBOutlet weak var activeBetLabel: UILabel!
    @IBOutlet weak var playerCount: UILabel!
    @IBOutlet weak var dealerCount: UILabel!
    
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
    
    @IBAction func dealButton(_ sender: UIButton) {
        playerDeal()
        if newPlayer.pointCount > 21 {
            lose()
        }
        
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        while theDealer.pointCount < 22 {
            dealerDeal()
            if theDealer.pointCount > 21 {
                win()
                break
            } else if theDealer.pointCount > newPlayer.pointCount && theDealer.pointCount < 22 {
                lose()
                break
            } else if theDealer.pointCount == newPlayer.pointCount {
                draw()
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeBetLabel.text = String(newPlayer.activeBet)
        playerCount.text = String(newPlayer.pointCount)
        dealerCount.text = String(theDealer.pointCount)
        
        hide_cards()
        
        playerDeal()
        playerDeal()
        dealerDeal()
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
    
    func playerDeal() {
        myDeck.dealCard(player: newPlayer)
        displayPlayerCard()
    }
    
    func dealerDeal() {
        myDeck.dealCard(player: theDealer)
        displayDealerCard()
    }
    
    func win() {
        segueMessage = 1
        newPlayer.activeBet *= 2
        newPlayer.balance += newPlayer.activeBet
        activeBetLabel.text = String(newPlayer.activeBet)
        pushSegue()
    }
    
    func lose() {
        segueMessage = 3
        activeBetLabel.text = String(newPlayer.activeBet)
        pushSegue()
    }
    
    func draw() {
        segueMessage = 2
        newPlayer.balance += newPlayer.activeBet
        pushSegue()
    }
    
    func displayPlayerCard() {
        switch newPlayer.cardCount {
        case 0:
            playerFirstCard.image = UIImage(named: myDeck.randomCard)
            playerFirstCard.isHidden = false
        case 1:
            playerSecondCard.image = UIImage(named: myDeck.randomCard)
            playerSecondCard.isHidden = false
        case 2:
            playerThirdCard.image = UIImage(named: myDeck.randomCard)
            playerThirdCard.isHidden = false
        case 3:
            playerFourthCard.image = UIImage(named: myDeck.randomCard)
            playerFourthCard.isHidden = false
        case 4:
            playerFifthCard.image = UIImage(named: myDeck.randomCard)
            playerFifthCard.isHidden = false
        default:
            print("Något oväntat hände i switchen")
        }
        newPlayer.cardCount += 1
        playerCount.text = String(newPlayer.pointCount)
    }
    
    func displayDealerCard() {
        switch theDealer.cardCount {
        case 0:
            dealerFirstCard.image = UIImage(named: myDeck.randomCard)
            dealerFirstCard.isHidden = false
        case 1:
            dealerSecondCard.image = UIImage(named: myDeck.randomCard)
            dealerSecondCard.isHidden = false
        case 2:
            dealerThirdCard.image = UIImage(named: myDeck.randomCard)
            dealerThirdCard.isHidden = false
        case 3:
            dealerFourthCard.image = UIImage(named: myDeck.randomCard)
            dealerFourthCard.isHidden = false
        default:
            print("Något oväntat hände i switchen hos dealern")
        }
        theDealer.cardCount += 1
        dealerCount.text = String(theDealer.pointCount)
    }
    
    func pushSegue() {
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.3, execute: {
            self.performSegue(withIdentifier: "resultSegue", sender: self)
        })
    }
    
    
}
