//
//  Card.swift
//  ToComSorte
//
//  Created by Gabriel Rossi on 30/05/23.
//

import Foundation

class Card: Equatable{
    
    var value: Int
    var suit: CardSuit
    
    init(value: Int, suit: CardSuit) {
        self.value = (value < 1 || value > 13) ? 1 : value
        self.suit = suit
    }
    
    init(){
        let suits: [CardSuit] = [.clubs, .diamonds, .hearts, .spades]
        //13
        self.value = Int.random(in: 1...13)
        self.suit = suits[ Int.random(in: 0..<suits.count) ]
    }
   
    func getSymbol() -> String{
        switch suit {
        case .clubs:
            return "♣︎"
        
        case .diamonds:
            return "♦︎"
            
        case .hearts:
            return "♥︎"
                
        default:
            return "♠︎"
        }
    }
        
    func getLabel() -> String{
        switch suit{
        case .clubs:
            return "A"
            
        case .diamonds:
            return "J"
            
        case .hearts:
            return "Q"
                
        case .spades:
            return "K"
        
        default:
            return "\(self.value)"
        }
    }
        
    static func == (lhs: Card, rhs: Card) -> Bool {
        //lhs rls
        return (lhs.value == rhs.value && lhs.suit == rhs.suit)
    }
}
  

enum CardSuit {
    case clubs, diamonds, hearts, spades
}
