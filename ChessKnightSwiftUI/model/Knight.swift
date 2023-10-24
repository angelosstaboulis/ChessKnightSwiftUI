//
//  Knight.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation

protocol Movable{
    func getValidMoves() -> [ChessCell]
}

protocol Piece: Movable{
    var currentLocation : ChessCell { get set }
}

class KnightChess: Piece{
    var currentLocation: ChessCell
    
    init(startingCell location: ChessCell) {
        self.currentLocation = location
    }
    
    func getValidMoves() -> [ChessCell] {
        var validMovesList : [ChessCell] = []
        
        let curX = currentLocation.xPosition
        let curY = currentLocation.yPosition
        
        
        if isMoveWithinBounds(x: curX + 2, y: curY + 1){
            validMovesList.append(ChessCell(x: curX + 2, y: curY + 1))
        }
        if isMoveWithinBounds(x: curX + 2, y: curY - 1){
            validMovesList.append(ChessCell(x: curX + 2, y: curY - 1))
        }
        if isMoveWithinBounds(x: curX - 2, y: curY + 1){
            validMovesList.append(ChessCell(x: curX - 2, y: curY + 1))
        }
        if isMoveWithinBounds(x: curX - 2, y: curY - 1){
            validMovesList.append(ChessCell(x: curX - 2, y: curY - 1))
        }
        
        if isMoveWithinBounds(x: curX + 1, y: curY + 2){
            validMovesList.append(ChessCell(x: curX + 1, y: curY + 2))
        }
        if isMoveWithinBounds(x: curX + 1, y: curY - 2){
            validMovesList.append(ChessCell(x: curX + 1, y: curY - 2))
        }
        if isMoveWithinBounds(x: curX - 1, y: curY + 2){
            validMovesList.append(ChessCell(x: curX - 1, y: curY + 2))
        }
        if isMoveWithinBounds(x: curX - 1, y: curY - 2){
            validMovesList.append(ChessCell(x: curX - 1, y: curY - 2))
        }
        return validMovesList
    }
    
    
    private func isMoveWithinBounds(x : Int, y : Int) -> Bool{
        if x < 0 || x > 6 - 1{
            return false
        }
        if y < 0 || y > 6 - 1{
            return false
        }
        return true
    }
    
}
