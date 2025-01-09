//
//  AddExerciseGroupView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//


//
//  AddExerciseGroupView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  AddExerciseGroupView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct AddExerciseGroupView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseSet: ExerciseSet

    @Query private var exerciseGroups: [ExerciseGroup] // Fetch all existing groups

    var body: some View {
        List {
            ForEach(exerciseGroups) { group in
                Button {
                    addGroupToSet(group)
                } label: {
                    HStack {
                        Text(group.name)
                        Spacer()
                        if exerciseSet.groups.contains(where: { $0.id == group.id }) {
                            Text("Added")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
                .disabled(exerciseSet.groups.contains(where: { $0.id == group.id }))
            }
        }
        .navigationTitle("Add Group")
    }

    private func addGroupToSet(_ group: ExerciseGroup) {
        exerciseSet.groups.append(group)
        try? modelContext.save()
    }
}
