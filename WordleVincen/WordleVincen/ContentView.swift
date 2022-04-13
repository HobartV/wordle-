//
//  ContentView.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/9.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dm : WordDataModel
    @State private var showSetting = false
    var body: some View {
        ZStack{
        NavigationView{
            VStack{
                Spacer()
            VStack(spacing: 0 ){
                ForEach(0...5, id: \.self) { index in
                    GuessView(guess:	 $dm.guesses[index])
                        .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                }
            }
            .frame(width: Global.boardwidth, height: 6 * Global.boardwidth / 5)
                Spacer()
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding()
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack{
                            if !dm.inplay {
                                Button{
                                    dm.newGame()
                                } label: {
                                    Text("New")
                                        .foregroundColor(.primary)
                                    
                                }
                            }
                            Button{
                                dm.newGame()
                            } label: {
                                Image(systemName: "questionmark.circle")
                            }
                        }
                    }
                    ToolbarItem(placement: .principal){
                        Text("Is this Wordle?")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        HStack{
                            Button{
                                withAnimation {
                                    dm.showStats.toggle()
                                }
                                
                            } label:{
                                Image(systemName: "chart.bar")
                                
                            }
                            Button{
                                showSetting.toggle()
                                
                            } label:{
                                Image(systemName: "gearshape.fill")
                            }
                            
                        }
                    }
                }
            .sheet(isPresented: $showSetting) {
                setting()
                
            }

            
        }
            if dm.showStats == true {
                statsView()
            }

    }
    //
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WordDataModel( ))
    }
}
