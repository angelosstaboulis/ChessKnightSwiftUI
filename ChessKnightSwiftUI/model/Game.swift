//
//  Game.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
class Game{
    var knight : KnightChess
    var targetCell: ChessCell
    var engine: Engine
    
    init(knight : KnightChess, engine: Engine, targetCell : ChessCell) {
        self.knight = knight
        self.engine = engine
        self.targetCell = targetCell
    }
    
    func changeKnightPosition(chessBoardCell cell : ChessCell){
        knight.currentLocation = cell
    }

    func findAllPaths() -> [PathChess]{
        var pathFoundList : [PathChess] = []
        
       engine.solve(knight: knight, targetCell: targetCell)
    
        for curMetaCell in engine.satisfiedNewCells{
            pathFoundList.append(curMetaCell.getPath())
        }
        
        return pathFoundList
    }
}
