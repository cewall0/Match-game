//
//  ContentView.swift
//  Match game
//
//  Created by Chad Wallace on 1/15/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            GeometryReader{geo in
                VStack {
                    Text("Sports Memory Game")
                        .font(.largeTitle)
                    
                    LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                        ForEach(cards) {card in
                            CardView(card: card,
                                     width: Int(geo.size.width/4 - 10),
                                     MatchedCards: $MatchedCards,
                                     UserChoices: $UserChoices)
                        } // end ForEach
                    } // end LazyVGrid
                    
                    VStack{
                        Text("Match these cards to win:")
                        LazyVGrid(columns: sixColumnGrid, spacing: 5) {
                            ForEach (cardValues, id:\.self){cardValue in
                                if !MatchedCards.contains(where: {$0.text == cardValue}){
                                    Text(cardValue)
                                        .font(.system(size:30))
                                } // end if
                            } // end ForEach
                        } // end LazyVGrid sixColumns
                    } // end VStack for items to match
                } // end VStack for the bigger contentView
            } // end geometryReader
        } // end ZStack
    } // end body View
} // end struct ContentView

#Preview {
    ContentView()
}
