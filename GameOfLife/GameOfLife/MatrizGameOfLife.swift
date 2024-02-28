//
//  MatrizGameOfLife.swift
//  GameOfLife
//
//  Created by Júlia Luz on 28/02/24.
//

import Foundation

func MatrizGameOfLife(){
    var matriz: [[Int]] = []
    
    var rows: [Int] = []
    
    for i in 0...5 {
        for j in 0...5 {
            rows.append(Int.random(in: 0...1))
        }
        matriz.append(rows)
        rows.removeAll()
    }
    
}
