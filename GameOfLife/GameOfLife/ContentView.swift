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
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Rosa"))
            VStack(spacing: 10){
                
                Text("The Game of Love")
                    .font(.system(size: 30))
                    .bold()
                    .padding(10)

                ForEach( matriz.indices, id:\.self ) { i in
                    HStack(spacing: 2){
                        ForEach( matriz.indices, id:\.self ){ j in
                            heart(color: matriz[i][j] == 1 ? .pink : .primary)
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
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.black)
                        .cornerRadius(50)
                        .overlay{
                            Text("GAME OF LIFE")
                                .foregroundStyle(.gray)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                        }
                }.onReceive(timer){ _ in
                    if self.isOn {
                        matriz = atualizaMatriz( matriz: matriz)
                    }
                    
                }
                
                .padding(20)
                Button{
                    isOn = false
                } label: {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.black)
                        .cornerRadius(50)
                        .overlay{
                            Text("PAUSE")
                                .foregroundStyle(.gray)
                                .font(.system(size: 30))
                                .fontWeight(.bold)

                        }
                }
            }
            .onAppear {
                matriz = MatrizGameOfLife()
            }
        }
        .ignoresSafeArea()
    }
    
    func heart(color: Color) -> some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 25))
            .foregroundStyle(color)
        
    }
}


#Preview {
    ContentView()
}
