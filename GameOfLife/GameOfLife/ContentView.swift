//
//  ContentView.swift
//  GameOfLife
//
//  Created by Júlia Luz on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var matriz: [[Int]] = []
//    @State var para: Bool = false
    var body: some View {
        VStack{
            
            ForEach( matriz.indices, id:\.self ) { i in
                HStack{
                    ForEach( matriz.indices, id:\.self ){ j in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(matriz[i][j] == 1 ? .pink : .gray)
                    }
                }
            }
            
            Button{
                matriz = MatrizGameOfLife()
                print(matriz)
            } label: {
                Text("Matriz")
            }
            
            Button{
                matriz = atualizaMatriz( matriz: matriz)
            } label: {
                Text("Play")
            }
        }
        .onAppear {
            
//            if !para{
//                matriz = MatrizGameOfLife()
//                para.toggle()
//            }
            
        }
        
        
    }
    
    
}
    #Preview {
        ContentView()
    }
    
    
