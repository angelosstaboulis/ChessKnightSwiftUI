//
//  Stack.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import Foundation
struct Stack {
    private var items: [ExtraCell] = []
    
    func peek() -> ExtraCell {
        return items.first!
    }
    
    mutating func pop() {
        items.removeFirst()
    }
  
    mutating func push(_ element: ExtraCell) {
        items.insert(element, at: 0)
    }
    
    func isEmpty() -> Bool{
        return items.count == 0
    }
}
