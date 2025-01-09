//
//  ExerciseGroupDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  ExerciseGroupDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//
//
//  ExerciseGroupDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  ExerciseSetDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  ExerciseGroupDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI

struct ExerciseGroupDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseGroup: ExerciseGroup

    var body: some View {
        Form {
            Section(header: Text("Group Details")) {
                TextField("Name", text: $exerciseGroup.name)
                Stepper("Repetitions: \(exerciseGroup.repetitions)", value: $exerciseGroup.repetitions, in: 1...100)
                Stepper("Rest After: \(Int(exerciseGroup.restAfter)) seconds", value: Binding(get: {
                    Int(exerciseGroup.restAfter)
                }, set: {
                    exerciseGroup.restAfter = Double($0)
                }), in: 0...600)
                TextField("Comment", text: Binding($exerciseGroup.comment, replacingNilWith: ""))
            }

            Section(header: Text("Exercises")) {
                List {
                    ForEach(exerciseGroup.exercises) { exercise in
                        Text(exercise.name) // Static, non-interactive text
                    }
                    .onDelete { indices in
                        removeExercises(at: indices)
                    }
                }
                NavigationLink("Add Exercise") {
                    AddExerciseView(exerciseGroup: $exerciseGroup)
                }
            }
        }
        .navigationTitle("Edit Exercise Group")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    try? modelContext.save()
                }
            }
        }
    }

    private func removeExercises(at offsets: IndexSet) {
        exerciseGroup.exercises.remove(atOffsets: offsets)
        try? modelContext.save()
    }
}
