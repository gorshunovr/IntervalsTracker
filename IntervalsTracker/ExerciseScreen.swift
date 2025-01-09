//
//  ExerciseScreen.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI

struct ExerciseScreen: View {
    let exerciseSet: ExerciseSet
    @State private var currentGroupIndex = 0
    @State private var currentExerciseIndex = 0

    var body: some View {
        VStack {
            Text("Set: \(exerciseSet.name)")
                .font(.title2)
                .padding()

            // Check if groups are available
            if !exerciseSet.groups.isEmpty {
                let currentGroup = exerciseSet.groups[currentGroupIndex]

                Text("Group: \(currentGroup.name)")
                    .font(.headline)
                Text("Repetition: \(currentGroupIndex + 1) of \(currentGroup.repetitions)")

                // Check if exercises are available
                if !currentGroup.exercises.isEmpty {
                    let currentExercise = currentGroup.exercises[currentExerciseIndex]

                    VStack {
                        Text("Exercise: \(currentExercise.name)")
                            .font(.largeTitle)
                        if let length = currentExercise.length {
                            Text("Time: \(Int(length)) seconds")
                        }
                        Text("Repetitions: \(currentExercise.repetitions)")
                        if currentExercise.weight > 0 {
                            Text("Weight: \(currentExercise.weight, specifier: "%.1f") kg")
                        }
                    }
                    .padding()
                } else {
                    Text("No exercises in this group.")
                        .foregroundColor(.red)
                        .padding()
                }
            } else {
                Text("No groups in this set.")
                    .foregroundColor(.red)
                    .padding()
            }

            HStack {
                Button("Finish") {
                    handleFinish()
                }
                .buttonStyle(.borderedProminent)
                .padding()

                Button("End Group") {
                    handleEndGroup()
                }
                .buttonStyle(.bordered)
                .padding()

                Button("End Set") {
                    handleEndSet()
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
        .navigationTitle("Exercise")
    }

    private func handleFinish() {
        guard !exerciseSet.groups.isEmpty else { return }
        let currentGroup = exerciseSet.groups[currentGroupIndex]
        guard !currentGroup.exercises.isEmpty else { return }

        if currentExerciseIndex < currentGroup.exercises.count - 1 {
            currentExerciseIndex += 1
        } else if currentGroupIndex < exerciseSet.groups.count - 1 {
            currentExerciseIndex = 0
            currentGroupIndex += 1
        } else {
            // End of the set
            handleEndSet()
        }
    }

    private func handleEndGroup() {
        if currentGroupIndex < exerciseSet.groups.count - 1 {
            currentGroupIndex += 1
            currentExerciseIndex = 0
        } else {
            handleEndSet()
        }
    }

    private func handleEndSet() {
        // Return to the previous screen or handle set completion
        print("Exercise set completed.")
    }
}
