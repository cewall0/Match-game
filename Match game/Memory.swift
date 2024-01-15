//
//  Memory.swift
//  Match game
//
//  Created by Chad Wallace on 1/15/24.
//

import Foundation
import SwiftUI


// The card class properties and functions
@Observable
class Card: Identifiable { // Identifiable means this type can be iodfemfied uniquely (because we have the id=UUID. Our other code won't look for what property to use as the Card's identifier, it will now know there is a unique id property.
    var id = UUID()
    var isFaceUp = false
    var isMatched = false
    var text:String
    
    init(text:String){
        self.text = text
    }
    
    func turnOver(){
        self.isFaceUp.toggle()
    }
    
} // end Card class


// The cardValues string
let cardValues: [String] = [
"🏀", "🏈", "⚽️", "⚾️", "🎾", "🏓", "🎱", "🥏", "🏐", "🏒", "⛳️", "🥊"
]

// a cunction that creates our cardList array. We need two of each sport icon.

func createCardList() -> [Card] {
    // create a blank list
    var cardList = [Card]()  // cardList is an array of Cards. This builds the empty array.
    
    for cardValue in cardValues { // for each sports icon string we have in the cardValues array that hoilds all possible card values. . .
        cardList.append(Card(text:cardValue)) // add the sport card class instance once
        cardList.append(Card(text:cardValue)) // then twice - so we have a matching pair to find.
    }
    return cardList // return the cardList array of Card instances
} // end func createCardList

// The faceDown Card is a card instance with a question mark on it.
let faceDownCard = Card(text: "?")
