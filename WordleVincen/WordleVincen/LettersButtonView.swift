//
//  LettersButtonView.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/10.
//

import SwiftUI

struct LettersButtonView: View {
    @EnvironmentObject var dm: WordDataModel
    var letter: String
    var body: some View {
        Button{
            dm.addToCurrentWord(letter)
        }  label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        //.buttonStyle(.plain)
        
       
    }
}


struct LettersButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LettersButtonView(letter: "L")
            .environmentObject(WordDataModel())
    }
}
