//
//  CardView.swift
//  Match game
//
//  Created by Chad Wallace on 1/15/24.
//

import SwiftUI

struct CardView: View {
    
    var card:Card
    let width:Int
    
    @Binding var MatchedCards:[Card]
    @Binding var UserChoices:[Card]
    
    var body: some View {
        
        // Show the card image if the card is supposed to be face up or if the card is already a found match
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}){
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 3))
            
        } // end if
        else { // Show the back of card if it is not supposed to be face up or if it is not part of an alredy found  match
            
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 3))
                .onTapGesture { // if the back of a card it tapped
                    if UserChoices.count == 0 { // if this is the first card the user is overturning of a "round"
                        card.turnOver() // then we turn over the card and show its contents.
                        UserChoices.append(card) // adding card to our UserChoices array to keep track of the first card shown in this "round"
                    } else if UserChoices.count == 1 { //One card for the round has already been turned over, so we are choosing our second card.
                        card.turnOver() // then we turn over the card.
                        UserChoices.append(card)// adding card to our UserChoices array to keep track of the second card shown in this "round"
                        withAnimation(Animation.linear.delay(1)){ // wait one second then flip cards back over.
                            for thisCard in UserChoices { // for each of the two cards shown in this "round"
                                thisCard.turnOver() // turn them back upside down
                            }
                        }
                    }
                    checkForMatch() // After we flipped the cards back over, we'll check for a match. If they are a match, when the view rests, they will stay face up.
                }
            
        }
    }// end body view
    
    func checkForMatch(){
        
        // if the first and second choices in the UserChoices array (the two cards flipped over) match...
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0]) // add the first UserChoice card to our matchedCards array
            MatchedCards.append(UserChoices[1]) // add the second UserChoice car to our matchedCards array
        }
        UserChoices.removeAll() // remove the two choices that were in our UserChoices array to prepare for choosing again.
    }
    
} // end struct Cardview View

//#Preview {
//    CardView()
//}
