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
                wrongCount += 1
                processNextStep()
            }
        }
        .alert("Game Over", isPresented: $showDialog) {
            Button("OK", action: resetGame)
        } message: {
            Text("Final Score:\nCorrect: \(correctCount)\nWrong: \(wrongCount)")
        }
    }
    func isNumberPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 { return false }
        }
        return true
    }
    
    func checkAnswer(isPrime: Bool) {
          timerRunning = false
          let correct = isPrime == isNumberPrime(currentNumber)
          if correct {
              correctCount += 1
          } else {
              wrongCount += 1
          }
          attempts += 1
          processNextStep()
      }
    
    func processNextStep() {
            if attempts >= 10 {
                showDialog = true
            } else {
                currentNumber = Int.random(in: 1...100)
                timerRunning = true
            }
        }
    func resetGame() {
        correctCount = 0
               wrongCount = 0
               attempts = 0
               currentNumber = Int.random(in: 1...100)
               timerRunning = true
           }
       }
#Preview {
    ContentView()
}

@main
struct Lab1_Luilson_SousaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
                                                             

