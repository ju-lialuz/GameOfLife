//
//  ContentView.swift
//  GameOfLife
//
//  Created by Júlia Luz on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var matriz: [[Int]] = []
    @State var isOn: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            
            ForEach( matriz.indices, id:\.self ) { i in
                HStack{
                    ForEach( matriz.indices, id:\.self ){ j in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(matriz[i][j] == 1 ? .pink : .gray)
                            .onTapGesture {
                                if matriz[i][j] == 0 {
                                    matriz[i][j] = 1
                                } else {
                                    matriz[i][j] = 0
                                }
                            }
                    }
                }
            }
            
            Button{
                isOn = true
            } label: {
                Text("Próxima geração")
                    .foregroundStyle(.pink)
            }.onReceive(timer){ _ in
                if self.isOn {
                    matriz = atualizaMatriz( matriz: matriz)
                }

            }
            
            Button{
                isOn = false
            } label: {
                Text("Pause")
                    .foregroundStyle(.pink)
            }

        }
        .onAppear {
            matriz = MatrizGameOfLife()

            
        }
        
        
    }
    
    
}
    #Preview {
        ContentView()
    }
    
    
