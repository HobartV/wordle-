//
//  GuessView.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/9.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    @EnvironmentObject var	dm:WordDataModel
    var body: some View {
        HStack(){
            ForEach(0...dm.numLetter-1, id: \.self){ index in // ini yang di ganti
                flipView(isFlipped: $guess.cardFlipped[index])
                {
                    Text(guess.guessLetter[index])
                        .foregroundColor(.primary)
                        .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .background(Color.systemBackground)

                    
                } back: {
                    Text(guess.guessLetter[index])
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                        .background(guess.bgColors[index])

                    
                }
                            
                            
                    
                    .font(.system(size: 36,weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
