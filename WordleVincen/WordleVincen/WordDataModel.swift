//
//  WordDataModel.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/10.
//

import SwiftUI

class WordDataModel: ObservableObject{
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var showStats = false
    @Published var toastText: String?
    var numLetter = 6
    var keyColors = [String : Color]()
    var matchLetters = [String]()
    var missPlacedLetter = [String]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inplay = false
    var gameOver = false
    var toastWords = ["Genius", "Magnificent", "Impressive","To Sloww","uhm.... OK.."]
    var curentStats : Statistic
    
    
    var gameStarted: Bool{
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disableKeys: Bool{
        !inplay || currentWord.count == numLetter
    }
    
    
    init (){
        curentStats = Statistic.loadStat()
        newGame()
        
    }
    //setup
    func newGame(){
        populateDefaults()
        if numLetter == 5 {
            selectedWord = Global.commonWords.randomElement()!
                } else if numLetter == 6 {
                    selectedWord = Global.commonWords2.randomElement()!
                } else {
                    selectedWord = Global.commonWords3.randomElement()!
                }
      
        currentWord = ""
        inplay = true
        tryIndex = 0
        gameOver = false
        print(selectedWord)
    }
    func populateDefaults(){
        guesses = []
        for index in 0...numLetter{
            guesses.append(Guess(index: index))
        }
      //
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters{
            keyColors[String(char)] = .unused
        }
        matchLetters = []
        missPlacedLetter = []
    }
    //game play
    func addToCurrentWord(_ letter: String){
        currentWord += letter
        updateRow()
    }
    func enterWord(){
        if currentWord == selectedWord{
            gameOver = true
            print("You Win")
            setCurrentGuessColors()
            curentStats.update(win: true, index: tryIndex)
            showToast(with: toastWords[tryIndex])
            inplay = false
            
            
            
        }
        else{
            if verifyWord(){
                print("it's a word ")
                setCurrentGuessColors()
                tryIndex += 1
                currentWord = ""
                if tryIndex == 6{
                    curentStats.update(win: false)
                    gameOver = true
                    inplay = false
                    showToast(with: selectedWord)
                }
            } else {
                withAnimation{
                    self.incorrectAttempts[tryIndex] += 1
                }
                showToast(with: "Not in the word list!")
                incorrectAttempts[tryIndex] = 0
            }

        }
    }
    func removeLetterFromCurrentWord(){
        currentWord.removeLast()
        updateRow()
    }
    func updateRow(){
        
        let guessWord = currentWord.padding(toLength: numLetter, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
        
    }
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
      
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map { String($0) }
        var frequency = [String : Int]()
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        for index in 0...numLetter-1 { // ini ganti buat slider
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetter[index]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                if !matchLetters.contains(guessLetter) {
                    matchLetters.append(guessLetter)
                    keyColors[guessLetter] = .correct
                }
                if missPlacedLetter.contains(guessLetter) {
                    if let index = missPlacedLetter.firstIndex(where: {$0 == guessLetter}) {
                        missPlacedLetter.remove(at: index)
                    }
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...numLetter-1 { // ini ganti buat slider
            let guessLetter = guesses[tryIndex].guessLetter[index]
            if correctLetters.contains(guessLetter)
                && guesses[tryIndex].bgColors[index] != .correct
                && frequency[guessLetter]! > 0 {
                guesses[tryIndex].bgColors[index] = .misplaced
                if !missPlacedLetter.contains(guessLetter) && !matchLetters.contains(guessLetter) {
                    missPlacedLetter.append(guessLetter)
                    keyColors[guessLetter] = .misplaced
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...numLetter-1 {		
            let guessLetter = guesses[tryIndex].guessLetter[index]
            if keyColors[guessLetter] != .correct
                && keyColors[guessLetter] != .misplaced {
                keyColors[guessLetter] = .wrong
            }
        }
        flipCards(for: tryIndex)
    }
    func flipCards(for row : Int){
        
        for col in 0...numLetter-1{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double (col) * 0.2 ){
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
    func showToast(with text: String?) {
        withAnimation {
            toastText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            toastText = nil
            if gameOver {
                withAnimation(Animation.linear(duration: 0.2).delay(3)) {
                    showStats.toggle()
                }
            }
        }
    }
    
    func shareResult() {
        let stat = Statistic.loadStat()
        let resultString = """
Wordle \(stat.games) \(tryIndex < 6 ? "\(tryIndex + 1)/6" : "")
\(guesses.compactMap{$0.results}.joined(separator: "\n"))
"""
        print(resultString)
        let activityController = UIActivityViewController(activityItems: [resultString], applicationActivities: nil)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            UIWindow.key?.rootViewController!
                .present(activityController, animated: true)
        case .pad:
            activityController.popoverPresentationController?.sourceView = UIWindow.key
            activityController.popoverPresentationController?.sourceRect = CGRect(x: Global.screenWidth / 2,
                                                                                  y: Global.screenHeight / 2,
                                                                                  width: 200,
                                                                                  height: 200)
            UIWindow.key?.rootViewController!.present(activityController, animated: true)
        default:
            break
        }
    }
    


}

