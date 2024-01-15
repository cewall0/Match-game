//
//  Memory.swift
//  Match game
//
//  Created by Chad Wallace on 1/15/24.
//

import Foundation
import SwiftUI

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
    
}

let cardValues: [String] = [
"🏀", "🏈", "⚽️", "⚾️", "🎾", "🏓", "🎱", "🥏", "🏐", "🏒", "⛳️", "🥊"
]

func createCardList() -> [Card] {
    // create a blank list
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text:cardValue))
        cardList.append(Card(text:cardValue))
    }
    return cardList
} // end func createCardList

let faceDownCard = Card(text: "?")
