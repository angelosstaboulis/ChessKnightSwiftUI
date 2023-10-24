//
//  ExtraCell.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
class ExtraCell{
    let previousCell: ExtraCell?
    let numberOfMovesMade: Int
    let cell: ChessCell
    
    init(previousCell cell : ExtraCell?, x xPosition : Int, y yPosition : Int, numberOfMovesMade num : Int) {
        self.previousCell = cell
        self.numberOfMovesMade = num
        self.cell = ChessCell(x: xPosition, y: yPosition)
    }
    
    func isEqual(cellToBeCompared cell : ChessCell ) -> Bool{
        return cell.xPosition == self.cell.xPosition && cell.yPosition == self.cell.yPosition
    }
    
    func hasMoreMoves() -> Bool{
        return numberOfMovesMade < 3
    }
    
    func getPath() -> PathChess{
        var cellVisitedList : [ChessCell] = []
        
        var currentCell : ExtraCell? = self
        
        for _ in 0..<numberOfMovesMade+1{
            cellVisitedList.append(currentCell!.cell)
            currentCell = currentCell!.previousCell
        }
        
        return PathChess(cells: cellVisitedList)
    }
}
