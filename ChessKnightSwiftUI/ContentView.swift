//
//  ContentView.swift
//  ChessKnightSwiftUI
//
//  Created by Angelos Staboulis on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    let chessBoardView = ChessboardSwiftUIView(chess: nil)
    @State var results:[String]
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    chessBoardView
                        .frame(width:320,height:320,alignment: .leading)
                       
                }
                .padding()
                Button{
                    results = chessBoardView.printResults()
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
                    results.removeAll()
                } label: {
                    Text("Reset").foregroundStyle(.white)
                } .background {
                    RoundedRectangle(cornerRadius: 22)
                        .frame(width:300,height:60)
                        .foregroundStyle(.blue)
                }.padding(35)
                Text("List Results").frame(width:280,height:45,alignment: .leading)
                List(results,id:\.self){item in
                    Text(item)
                }
                
            } .navigationTitle("Chessboard")
            .navigationBarTitleDisplayMode(.inline)
        }
 

    }
}

#Preview {
    ContentView(results: [])
}
