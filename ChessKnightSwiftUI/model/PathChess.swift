//
//  PathChess.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
class PathChess{
    let path : [ChessCell]
    var notation : String{
        get{
            var fullPathNotation = ""
            
            for cell in path{
                var move = ""
                move = move.appending(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"][cell.xPosition])
      
                move = move.appending("\(cell.yPosition+1)")
                
                fullPathNotation = fullPathNotation.appending(" \(move) <- ")
            }
            return String(fullPathNotation.dropLast(3))
        }
    }
    
    init(cells celllist: [ChessCell]) {
        self.path = celllist
    }
}
