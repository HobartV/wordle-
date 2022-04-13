//
//  Guess.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/9.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "       "
    var bgColors = [Color](repeating: .wrong, count: 7)
    var cardFlipped = [Bool](repeating: false, count: 7)//ini yng di gantti, dari guessview
    var guessLetter: [String]{
        word.map{String($0)}
    }
    
    var results: String {
        let tryColors: [Color : String] = [.misplaced : "🟨", .correct : "🟩", .wrong : "⬛"]
        return bgColors.compactMap {tryColors[$0]}.joined(separator: "")
    }
}
	
