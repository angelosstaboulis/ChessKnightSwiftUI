//
//  ChessboardDelegate.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
protocol ChessBoardDelegate:class{
    func onKnightPositionChanged(newLocation : Coordinate)
}
