//
//  ViewController.swift
//  Concentration
//
//  Created by Jigar Thakkar on 24/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbersOfPairsOfCards: Int {
        return (cardButtons.count+1)/2
    }
    private lazy var game = Concentration(numbersOfPairsOfCards: numbersOfPairsOfCards)
    
    private(set) var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" }  }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9168781293, green: 1, blue: 0.9328976373, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["👻","🦇","🙀","😈","🎃","🍭","🍎"]
    
    private var emoji = [Int:String]()
    
    private func emoji(for card:Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int{
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
             return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
