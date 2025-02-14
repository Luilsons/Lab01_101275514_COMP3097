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
    @State private var wrongCount = 0
    @State private var attempts = 0
    @State private var showDialog = false
    @State private var timerRunning = true
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(currentNumber)")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.blue)
            
            HStack(spacing: 50) {
                           Button("Prime") { checkAnswer(isPrime: true) }
                               .font(.title)
                               .foregroundColor(.blue)
                           Button("Not Prime") { checkAnswer(isPrime: false) }
                               .font(.title)
                               .foregroundColor(.blue)
                       }
            Text("Correct: \(correctCount) | Wrong: \(wrongCount)")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .onReceive(timer) { _ in
                        if timerRunning {
                            
                        }

