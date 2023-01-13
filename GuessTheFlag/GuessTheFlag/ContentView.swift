//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var qusetionNumber = 0
    @State private var score = 0

    var body: some View {
        VStack {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(color: .white, radius: 5)
                                    .environment(\.colorScheme, .dark)
                                    .shadow(color: .black, radius: 5)
                                    .environment(\.colorScheme, .light)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Spacer()
                    HStack(spacing: 50) {
                        Text("Questions: \(qusetionNumber)/10")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.semibold))
                        Text("Score: \(score)")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.bold))
                    }
                    Spacer()
                }
                .padding()
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                if qusetionNumber < 10
                {
                    Button("Continue", action: askQuestion)
                }
                else
                {
                    Button("Restart Game", action: restartGame)
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        qusetionNumber += 1
        if qusetionNumber < 10
        {
            if number == correctAnswer {
                alertTitle = "Correct"
                score += 1
                alertMessage = "Your score is \(score)"
            } else {
                alertTitle = "Wrong!"
                alertMessage = "That’s the flag of \(countries[number])"
            }
        }
        else
        {
            if number == correctAnswer {
                score += 1

            }
            if score >= 8 {
                alertTitle = "Congratulations!!!"
                alertMessage = "Your have won the game with score \(score)"
            } else {
                alertTitle = "You Loose"
                alertMessage = "Better luck next time."
            }
        }
        showingAlert = true
    }
    
    func restartGame()
    {
        qusetionNumber = 0
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}