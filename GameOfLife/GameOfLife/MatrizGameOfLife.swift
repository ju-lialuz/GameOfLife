//
//  MatrizGameOfLife.swift
//  GameOfLife
//
//  Created by Júlia Luz on 28/02/24.
//

import Foundation

func MatrizGameOfLife() -> [[Int]]{
    var matriz: [[Int]] = []
    var rows: [Int] = []
    
    for _ in 0...9 {
        for _ in 0...9 {
            rows.append(0)
        }
        matriz.append(rows)
        rows.removeAll()
    }
    
    return matriz
}

func findNeighborhoods(i: Int, j: Int, matriz: [[Int]]) -> Int {
    var qtd: Int = 0
    
    if matriz.count > 0 && matriz[0].count > 0 {
        for ml in max(0, i - 1)...min(i + 1, matriz.count - 1){
            for mc in max(0, j - 1)...min(j + 1, matriz.count - 1){
                if !(i == ml && j == mc) {
                    if matriz[ml][mc] == 1 {
                        qtd += 1
                    }
                }
                
            }
        }
                

    }
    
    return qtd
}

func rules(i: Int, j: Int, matriz: [[Int]]) -> Int {
    
    let qtd = findNeighborhoods(i: i, j: j, matriz: matriz)
    var life = matriz[i][j]
    
    if life == 1 {
        if qtd < 2 || qtd > 3{
            life = 0
        } else if qtd == 2 || qtd == 3 {
            life = 1
            
        }
        
    }else {
        if qtd == 3 {
            life = 1
            
        }
    }
    
    return life

    
}

func atualizaMatriz( matriz: [[Int]]) -> [[Int]] {
    var matrizAtualizada: [[Int]] = []
    
    var linhaAtualizada: [Int] = []
    
    
    for i in 0...matriz.count - 1 {
        for j in 0...matriz[i].count - 1{
            let estado = rules(i: i, j: j, matriz: matriz)
            linhaAtualizada.append(estado)
            
            
        }
        matrizAtualizada.append(linhaAtualizada)
        
        linhaAtualizada.removeAll()
   
        
    }
    return matrizAtualizada
}
