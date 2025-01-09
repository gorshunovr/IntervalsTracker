//
//  ExerciseDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//


import SwiftUI

struct ExerciseDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exercise: Exercise

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Name", text: $exercise.name)
                Stepper("Repetitions: \(exercise.repetitions)", value: $exercise.repetitions, in: 1...100)
                Stepper("Weight: \(exercise.weight, specifier: "%.1f") kg", value: $exercise.weight, in: 0...500, step: 0.5)
                Stepper("Rest After: \(Int(exercise.restAfter)) seconds", value: Binding(get: {
                    Int(exercise.restAfter)
                }, set: {
                    exercise.restAfter = Double($0)
                }), in: 0...600)
                TextField("Comment", text: Binding($exercise.comment, replacingNilWith: ""))
            }

            Section(header: Text("Length")) {
                Stepper("Length: \(Int(exercise.length ?? 0)) seconds", value: Binding(get: {
                    Int(exercise.length ?? 0)
                }, set: {
                    exercise.length = Double($0)
                }), in: 0...3600)
            }
        }
        .navigationTitle("Edit Exercise")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    try? modelContext.save()
                }
            }
        }
    }
}
