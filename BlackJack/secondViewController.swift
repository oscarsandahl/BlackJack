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
        myDeck.dealOneCard(anyPlayer: newPlayer)
        displayPlayerCard()
        if newPlayer.pointCount > 21 {
            lose()
        }
    }
    @IBAction func stopButton(_ sender: UIButton) {
        while theDealer.pointCount < 22 {
            myDeck.dealOneCard(anyPlayer: theDealer)
            displayDealerCard()
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
        hide_cards()
        activeBetLabel.text = String(newPlayer.activeBet)
        playerCount.text = String(newPlayer.pointCount)
        dealerCount.text = String(theDealer.pointCount)
        
        myDeck.dealOneCard(anyPlayer: newPlayer)
        displayPlayerCard()
        
        myDeck.dealOneCard(anyPlayer: newPlayer)
        displayPlayerCard()
        
        myDeck.dealOneCard(anyPlayer: theDealer)
        displayDealerCard()
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
        case 1:
            playerFirstCard.image = UIImage(named: newPlayer.hand[0].getCardName())
            playerFirstCard.isHidden = false
        case 2:
            playerSecondCard.image = UIImage(named: newPlayer.hand[1].getCardName())
            playerSecondCard.isHidden = false
        case 3:
            playerThirdCard.image = UIImage(named: newPlayer.hand[2].getCardName())
            playerThirdCard.isHidden = false
        case 4:
            playerFourthCard.image = UIImage(named: newPlayer.hand[3].getCardName())
            playerFourthCard.isHidden = false
        case 5:
            playerFifthCard.image = UIImage(named: newPlayer.hand[4].getCardName())
            playerFifthCard.isHidden = false
        default:
            print("playerDefault")
        }
        playerCount.text = String(newPlayer.pointCount)
    }
    
    func displayDealerCard() {
        switch theDealer.cardCount {
        case 1:
            dealerFirstCard.image = UIImage(named: theDealer.hand[0].getCardName())
            dealerFirstCard.isHidden = false
        case 2:
            dealerSecondCard.image = UIImage(named: theDealer.hand[1].getCardName())
            dealerSecondCard.isHidden = false
        case 3:
            dealerThirdCard.image = UIImage(named: theDealer.hand[2].getCardName())
            dealerThirdCard.isHidden = false
        case 4:
            dealerFourthCard.image = UIImage(named: theDealer.hand[3].getCardName())
            dealerFourthCard.isHidden = false
        case 5:
            dealerFifthCard.image = UIImage(named: theDealer.hand[4].getCardName())
            dealerFifthCard.isHidden = false
        default:
            print("dealerDefault")
        }
        dealerCount.text = String(theDealer.pointCount)
    }
    
    func pushSegue() {
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.3, execute: {
            self.performSegue(withIdentifier: "resultSegue", sender: self)
        })
    }
    
    
}
