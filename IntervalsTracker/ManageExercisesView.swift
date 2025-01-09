//
//  ManageExercisesView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct ManageExercisesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]

    @State private var newExerciseName: String = ""
    @State private var editingExercise: Exercise? = nil
    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: .constant(exercise))) {
                        HStack {
                            Text(exercise.name)
                                .font(.headline)
                            Spacer()
                            Button(role: .destructive) {
                                modelContext.delete(exercise)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }

            HStack {
                TextField(isEditing ? "Edit Exercise" : "New Exercise", text: $newExerciseName)
                    .textFieldStyle(.roundedBorder)
                Button(isEditing ? "Save" : "Add") {
                    if isEditing, let exercise = editingExercise {
                        exercise.name = newExerciseName
                        try? modelContext.save()
                        isEditing = false
                        editingExercise = nil
                    } else {
                        let newExercise = Exercise(name: newExerciseName)
                        modelContext.insert(newExercise)
                    }
                    newExerciseName = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(newExerciseName.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Manage Exercises")
    }
}
