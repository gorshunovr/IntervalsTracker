//
//  RestTimerScreen.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI

struct RestTimerScreen: View {
    @State private var restTime: Int
    let lastExercise: Exercise
    let nextExercise: Exercise?

    var body: some View {
        VStack {
            Text("Resting after: \(lastExercise.name)")
            if let nextExercise = nextExercise {
                Text("Next: \(nextExercise.name)")
            }

            Text("Time: \(restTime) seconds")
                .font(.title)
                .padding()

            Button("Stop Rest") {
                // Handle stopping the rest timer
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .onAppear {
            startRestTimer()
        }
    }

    private func startRestTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            guard restTime > 0 else {
                timer.invalidate()
                // Proceed to next exercise screen
                return
            }
            restTime -= 1
        }
    }
}
