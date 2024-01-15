//
//  ContentView.swift
//  Match game
//
//  Created by Chad Wallace on 1/15/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    private var fourColumGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var sixColumGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
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
                    
                    LazyVGrid(columns: fourColumGrid, spacing: 10) {
                        ForEach(cards) {card in
                            CardView(card: card,
                                     width: Int(geo.size.width/4 - 10),
                                     MatchedCards: $MatchedCards,
                                     UserChoices: $UserChoices)
                        } // end ForEach
                    } // end LazyVGrid
                } // end VStack
            } // end geometryReader
        } // end ZStack
    } // end body View
} // end struct ContentView

#Preview {
    ContentView()
}
