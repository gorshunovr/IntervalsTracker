//
//  RemoveExerciseGroupView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct RemoveExerciseGroupView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseSet: ExerciseSet

    var body: some View {
        List {
            ForEach(exerciseSet.groups) { group in
                Button(role: .destructive) {
                    removeGroupFromSet(group)
                } label: {
                    Text(group.name)
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Remove Group")
    }

    private func removeGroupFromSet(_ group: ExerciseGroup) {
        if let index = exerciseSet.groups.firstIndex(where: { $0.id == group.id }) {
            exerciseSet.groups.remove(at: index)
            try? modelContext.save()
        }
    }
}
