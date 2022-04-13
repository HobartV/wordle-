//
//  Keyboard.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/10.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordDataModel
    var topRowAray = "QWERTYUIOP".map{ String($0)}
    var secondRowAray = "ASDFGHJKL".map{ String($0)}
    var thirdRowAray = "ZXCVBNM".map{ String($0)}
    var body: some View {
        VStack{
            HStack(spacing: 2){
                ForEach(topRowAray,id: \.self){letter in
                    LettersButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 :1)
            }
            HStack(spacing: 2){
                ForEach(secondRowAray,id: \.self){letter in
                    LettersButtonView(letter: letter)
                }.disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 :1)
            }

            HStack(spacing: 2){
                Button{
                    dm.enterWord()
                    
                } label:{
                    Text("enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dm.currentWord.count<5 || !dm.inplay )
                .opacity((dm.currentWord.count<5 || !dm.inplay ) ? 0.6 :1)
                ForEach(thirdRowAray,id: \.self){letter in
                    LettersButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.6 :1)
                Button{
                    dm.removeLetterFromCurrentWord()
                }label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 20,weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
                .disabled(!dm.inplay || dm.currentWord.count==0)
                .opacity((dm.currentWord.count<5 || !dm.inplay) ? 0.6: 1)
            }

        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}
