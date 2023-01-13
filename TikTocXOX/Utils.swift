//
//  Utils.swift
//  TikTocXOX
//
//  Created by Mustafa Ali KILCI on 13.01.2023.
//

import Foundation

func checkWinner(list: [String], letter: String) -> Bool {
    let winningSequences = [
        // Horizontal rows
        [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ],
        // Diagonals
        [ 0, 4, 8 ], [ 2, 4, 6 ],
        // Vertical rows
        [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ],
    ]
    
    for sequence in winningSequences {
        var score = 0
        
        for match in sequence {
            if list[match] == letter {
                score += 1
                
                if score == 3 {
                    print("\(letter) KAZANDIN!")
                    return true
                }
            }
        }
    }
    return false
}
