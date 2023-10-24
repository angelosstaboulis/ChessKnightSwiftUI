//
//  ContentView.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    let chessBoardView = ChessboardSwiftUIView(chess: nil)
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    chessBoardView
                        .frame(width:320,height:320,alignment: .leading)
                       
                }
                .padding()
                Button {
                    chessBoardView.printResults()
                } label: {
                    Text("Print Results").foregroundStyle(.white)
                }.padding(45.0)
                    .background {
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width:300,height:60)
                            .foregroundStyle(.blue)
                    }
                Button {
                    chessBoardView.applyConfiguration()
                } label: {
                    Text("Reset").foregroundStyle(.white)
                } .background {
                    RoundedRectangle(cornerRadius: 22)
                        .frame(width:300,height:60)
                        .foregroundStyle(.blue)
                }
                
            } .navigationTitle("Chessboard")
            .navigationBarTitleDisplayMode(.inline)
        }
 

    }
}

#Preview {
    ContentView()
}
