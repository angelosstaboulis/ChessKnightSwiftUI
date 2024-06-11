//
//  ShowResults.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 11/6/24.
//

import SwiftUI

struct ShowResults: View {
    @State var results:[String]
    var body: some View {
        List(results,id:\.self){item in
            Text(item)
        }
    }
}

#Preview {
            ShowResults(results: [])
}
