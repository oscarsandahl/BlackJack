//
//  BlackJackTests.swift
//  BlackJackTests
//
//  Created by Oscar Sandahl on 2019-01-07.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import BlackJack

class BlackJackTests: QuickSpec {

    override func spec() {
        var player: Player!
        var deck: Deck!
        
        describe("Player") {
            beforeEach {
                player = Player()
            }
            
            context("reset their bet") {
                it("so active bet should be 0") {
                    // Arrange
                    player.activeBet = 20
                    
                    // Act
                    player.resetBet()
                    
                    // Assert
                    expect(player.activeBet) == 0
                }
            }
            
            context("bet all their money") {
                it("so balance should be 0") {
                    player.betAllMoney()
                    expect(player.balance) == 0
                }
            }
        }
        
        describe("Deck of cards") {
            beforeEach {
                deck = Deck()
            }
            
            context("that is initialized") {
                it("should contain 52 cards") {
                    expect(deck.deckOfCards.count) == 52
                }
            }
            
            context("dealing one card") {
                it("should remove 1 card from the deck") {
                    deck.dealOneCard(anyPlayer: Player())
                    expect(deck.deckOfCards.count) == 51
                }
            }
        }
    }
    
}
