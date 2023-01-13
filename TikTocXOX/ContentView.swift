//
//  ContentView.swift
//  TikTocXOX
//
//  Created by Mustafa Ali KILCI on 2.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endGameText = "TicTacToe"
    @State private var gameEnded = false
    private var ranges = [(0..<3),(3..<6),(6..<9)]
    
    
    var body: some View {
        VStack {
            Text(endGameText)
                .alert(endGameText, isPresented: $gameEnded) {
                    Button("Yenile", role: .destructive, action: resetGame)
                }
            Spacer()
            ForEach(ranges, id: \.self) { range in
                HStack {
                    ForEach(range, id: \.self) { i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        print("Dokun: \(i)")
                                        playerTap(index: i)
                                    }
                            )
                    }
                }
            }
            Spacer()
            Button("Reset") {
                resetGame()
            }
        }
    }
    
    func resetGame() {
        endGameText = "X O Games"
        moves = ["","","","","","","","",""]
    }
    
    func playerTap(index: Int) {
        if moves[index] == "" {
            moves[index] = "X"
            botMove()
        }
        
        for letter in ["X", "O"] {
            if checkWinner(list: moves, letter: letter) {
                endGameText = "\(letter) KAZANDIN!"
                gameEnded = true
                break
            }
        }
    }
    
    func botMove() {
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        // Check the available moves left
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
        // Make sure there are moves left before bot moves
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
        
        // Logging
        print(availableMoves)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
