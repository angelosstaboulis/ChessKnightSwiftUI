//
//  ChessboardSwiftUIView.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
import SwiftUI
struct ChessboardSwiftUIView:UIViewRepresentable{
    var chess:Chessboard?
    var game:Game?
    var knightInitialCell:ChessCell?
    var targetInitialCell:ChessCell?
    var knight:KnightChess?
    
    init(chess: Chessboard?) {
        self.chess = Chessboard()
        knightInitialCell = ChessCell(x: 1, y: 1)
        targetInitialCell = ChessCell(x: 4, y: 3)
        knight = KnightChess(startingCell: knightInitialCell!)
        game = Game(knight: knight!, engine: Engine(), targetCell: targetInitialCell!)
        
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(chess!, game: game!)
    }
    func applyConfiguration(){
        chess?.applyConfiguration()
    }

    func printResults()->[String]{
        guard let game = self.game else{return []}
        let allPathList = game.findAllPaths()
        var results:[String] = []
        for path in allPathList{
            results.append(path.notation)
        }
        return results
    }
    func updateUIView(_ uiView: Chessboard, context: Context) {
        uiView.delegate = context.coordinator
    }
    
    typealias UIViewType = Chessboard
    
    func makeUIView(context: Context) -> Chessboard {
        chess?.applyConfiguration()
        return chess!
    }
    class Coordinator:NSObject,ChessBoardDelegate{
        var parent: Chessboard
        var game:Game
        init(_ parent: Chessboard,game:Game) {
            self.parent = parent
            self.game =  game
        }
        
        func onKnightPositionChanged(newLocation: Coordinate) {
            let chessCell = ChessCell(x: newLocation.x, y: newLocation.y)
            game.changeKnightPosition(chessBoardCell: chessCell)
        }
        
        
    }
    
}
