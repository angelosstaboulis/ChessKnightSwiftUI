//
//  Engine.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
class Engine{
    var satisfiedNewCells : [ExtraCell] = []
    var newCells:[ExtraCell] = []
    var virtualKnight:KnightChess!
    var startingCell:ExtraCell!
    var validKnightMoves:[ChessCell] = []
    var data = Stack()
  
    func dfs(startingCell:ExtraCell,targetCell:ChessCell){
        data.push(startingCell)
        while !data.isEmpty(){
            let topInStackCell = data.peek()
            if !topInStackCell.hasMoreMoves(){
                if topInStackCell.isEqual(cellToBeCompared: targetCell){
                    satisfiedNewCells.append(topInStackCell)
                }
                data.pop()
                continue
            }
            virtualKnight.currentLocation = topInStackCell.cell
            
            validKnightMoves = virtualKnight.getValidMoves()
            newCells = convertCellsToNewCells(cellsList: validKnightMoves, previousCell: topInStackCell)
            data.pop()
            
            for newCell in newCells {
                data.push(newCell)
            }
        }
    }
    func solve(knight : KnightChess, targetCell : ChessCell){
        
        startingCell = ExtraCell(previousCell: nil,
                                    x: knight.currentLocation.xPosition,
                                    y: knight.currentLocation.yPosition,
                                    numberOfMovesMade: 0)
        
        virtualKnight = KnightChess(startingCell: knight.currentLocation)
               
        
        dfs(startingCell: startingCell, targetCell: targetCell)

    }
    

    private func convertCellsToNewCells(cellsList : [ChessCell], previousCell : ExtraCell) -> [ExtraCell]{
        var metaCellList : [ExtraCell] = []
        for cell in cellsList {
            metaCellList.append(ExtraCell(previousCell: previousCell, x: cell.xPosition, y: cell.yPosition, numberOfMovesMade: previousCell.numberOfMovesMade + 1 ))
        }
        return metaCellList
    }
}
