//
//  GameView.swift
//  GameOfLife
//
//  Created by Júlia Luz on 27/02/24.
//

import Foundation
import SwiftUI

struct GameView: View {
    @State var cells: [[Cell]] = Array(repeating: Array(repeating: Cell(), count: 10), count: 10)
    @Binding var isPaused: Bool

    // will implement this in step 4
}
