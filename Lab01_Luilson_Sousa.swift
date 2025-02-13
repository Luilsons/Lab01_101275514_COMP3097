//
//  Lab01_Luilson_Sousa.swift
//  Lab01_Luilson_Sousa
//
//  Created by Luilson Marcos Sousa dos Reis on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber = Int.random(in: 1...100)
    @State private var isCorrect: Bool? = nil
    @State private var correctCount = 0
    }
}
