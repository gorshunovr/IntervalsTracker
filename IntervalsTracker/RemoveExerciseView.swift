//
//  RemoveExerciseView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//


//
//  RemoveExerciseView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct RemoveExerciseView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseGroup: ExerciseGroup

    var body: some View {
        List {
            ForEach(exerciseGroup.exercises) { exercise in
                Button(role: .destructive) {
                    removeExerciseFromGroup(exercise)
                } label: {
                    Text(exercise.name)
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Remove Exercise")
    }

    private func removeExerciseFromGroup(_ exercise: Exercise) {
        if let index = exerciseGroup.exercises.firstIndex(where: { $0.id == exercise.id }) {
            exerciseGroup.exercises.remove(at: index)
            try? modelContext.save()
        }
    }
}