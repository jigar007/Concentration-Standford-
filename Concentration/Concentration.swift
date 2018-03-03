//
//  Concentration.swift
//  Concentration
//
//  Created by Jigar Thakkar on 24/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import Foundation

struct Concentration {
    
    
    private(set) var cards = [Card]()
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get{
            return cards.indices.filter  { cards[$0].isFaceUp }.oneEndOnly
 

        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numbersOfPairsOfCards: Int) {
        assert(numbersOfPairsOfCards>0,"Concentration.init(\(numbersOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numbersOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
    }
    // TODO: Shuffle the cards

}

extension Collection{
    var oneEndOnly: Element?{
        return count == 1 ? first : nil
    }
}
