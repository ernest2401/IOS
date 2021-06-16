//
//  concentrationGame.swift
//  concentration
//
//  Created by Ernest Migranov on 31.05.2021.
//

import Foundation

class concentrationGame{
    
    var cards = [Card]()
    
    var indexOfAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = indexOfAndOnlyFacedUpCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfAndOnlyFacedUpCard = nil
            } else {
                for flipDown in cards.indices{
                    cards[flipDown].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
    }
    
}
