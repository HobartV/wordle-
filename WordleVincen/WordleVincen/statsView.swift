//
//  statsView.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/11.
//

import SwiftUI
struct statsView: View {
    @EnvironmentObject var dm : WordDataModel
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Spacer()
                Button {
                    withAnimation {
                        dm.showStats.toggle()
                    }
                } label: {
                    Text("X")
                }
                .offset(x:20, y: 10)
            }
            Text("STATISTICS")
                .font(.headline)
                .fontWeight(.bold)
            HStack{
                SingleStat(value: dm.curentStats.games, text: "Played")
                if dm.curentStats.games != 0 {
                    SingleStat(value: Int(100 * dm.curentStats.wins/dm.curentStats.games), text: "Win %")
                    
                }
                SingleStat(value: dm.curentStats.streak, text: "Curent Streak")
                    .fixedSize(horizontal: false, vertical: true)
                SingleStat(value: dm.curentStats.maxStreak, text: "Max Streak")
                    .fixedSize(horizontal: false, vertical: true)
                
                
            }
            Text("GUESS DISTRIBUTION")
                .font(.headline)
                .fontWeight(.bold)
            VStack(spacing:5){
                ForEach (0..<6) { index in
                    HStack {
                        Text("\(index + 1)")
                        if dm.curentStats.frequencies[index] == 0{
                            Rectangle()
                                .fill(Color.wrong)
                                .frame(width: 22, height: 20)
                                .overlay(
                                    Text("0")
                                        .foregroundColor(.black)
                                )
                        }
                        else {
                            
                            if let maxValue = dm.curentStats.frequencies.max() {
                                Rectangle()
                                    .fill((dm.tryIndex == index && dm.gameOver)
                                            ? Color.correct
                                            :Color.wrong)
                                    .frame( width:
                                                CGFloat(dm.curentStats.frequencies[index]) / CGFloat(maxValue) * 210 ,
                                            height: 20)
                                    .overlay(
                                        Text("\(dm.curentStats.frequencies[index])")
                                            .foregroundColor(.black)
                                            .padding(.horizontal,5),
                                        alignment: .trailing
                                    )
                                
                                
                                
                            } //
                            
                        }
                        Spacer()
                        
                    }
                }
                if dm.gameOver {
                    HStack {
                        Spacer()
                        Button {
                            dm.shareResult()
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.correct)
                        }
                    }
                }
            }
            
            
            
            Spacer()
            
        }
        .padding(.horizontal,40)
        .frame(width: 320, height: 370)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.systemBackground))
        .shadow(color: .black , radius: 10)
        .offset(y:-70)
        .onAppear{
            print(dm.curentStats)
        }
    }
}


struct statsView_Previews: PreviewProvider {
    static var previews: some View {
        statsView()
            .environmentObject(WordDataModel())
    }
}

struct SingleStat: View {
    let value: Int
    let text: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.largeTitle)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}




