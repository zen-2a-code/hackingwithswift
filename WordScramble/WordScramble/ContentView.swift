//
//  ContentView.swift
//  WordScramble
//
//  Created by Stoyan Hristov on 8.01.26.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var currentWord = ""
    
    @State var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @FocusState private var isTextFiledFocued: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        TextField("Please enter 8 letters word", text: $currentWord)
                            .focused($isTextFiledFocued)
                            .textInputAutocapitalization(.never)
                        
                        if !currentWord.isEmpty {
                            Button {
                                currentWord = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title3)
                            }
                            .buttonStyle(.plain)
                        }
                     }
                }
      
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
            .onTapGesture { isTextFiledFocued = false }
            .alert(alertTitle, isPresented: $showAlert) {} message: {
                Text(alertMessage)
            }
        }
    }
    
    func addNewWord() {
        let word = currentWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard word.count > 1 else { return }
        
        guard isOriginal(word: word) else {
            showAlertError(alertTitle: "Word used already", alertMessage: "Be more original")
            return
        }
        
        guard isWordPossible(word: word) else {
            showAlertError(alertTitle: "Word not possible", alertMessage: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isRealWord(word: word) else {
            showAlertError(alertTitle: "Word not recognized", alertMessage: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(word, at: 0)
        }
        
        currentWord = ""
    }
    
    func startGame() {
        if let startWordsFileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWordsString = try? String(contentsOf: startWordsFileUrl, encoding: .utf8) {
                let allWords = startWordsString.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Kaiba"
                return
            }
        }
        
        fatalError("Count not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isWordPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let indexOfLetter = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: indexOfLetter)
            } else {
                return false
            }
        }
        return true
    }
    
    func isRealWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func showAlertError(alertTitle: String, alertMessage: String) {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        showAlert = true
    }
}

#Preview {
    ContentView()
}
