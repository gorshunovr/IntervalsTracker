//
//  AddExerciseView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//


//
//  AddExerciseView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  AddExerciseView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseGroup: ExerciseGroup

    @Query private var exercises: [Exercise] // Fetch all existing exercises

    var body: some View {
        List {
            ForEach(exercises) { exercise in
                Button {
                    addExerciseToGroup(exercise)
                } label: {
                    HStack {
                        Text(exercise.name)
                        Spacer()
                        if exerciseGroup.exercises.contains(where: { $0.id == exercise.id }) {
                            Text("Added")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
                .disabled(exerciseGroup.exercises.contains(where: { $0.id == exercise.id }))
            }
        }
        .navigationTitle("Add Exercise")
    }

    private func addExerciseToGroup(_ exercise: Exercise) {
        exerciseGroup.exercises.append(exercise)
        try? modelContext.save()
    }
}
