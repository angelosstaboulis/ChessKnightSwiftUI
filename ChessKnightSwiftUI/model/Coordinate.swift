//
//  Coordinate.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
class Coordinate{
    let x: Int
    let y: Int
    
    init(x xPos: Int, y yPos: Int) {
        self.x = xPos
        self.y = yPos
    }
    
    func isSameCoordinate(with coordinate: Coordinate) -> Bool{
        return self.x == coordinate.x && self.y == coordinate.y
    }
}
