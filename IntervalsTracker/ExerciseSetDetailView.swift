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

//
//  ExerciseSetDetailView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI

struct ExerciseSetDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var exerciseSet: ExerciseSet

    var body: some View {
        Form {
            Section(header: Text("Set Details")) {
                TextField("Name", text: $exerciseSet.name)
                TextField("Comment", text: Binding($exerciseSet.comment, replacingNilWith: ""))
            }

            Section(header: Text("Groups")) {
                List {
                    ForEach(exerciseSet.groups) { group in
                        Text(group.name) // Static, non-interactive text
                    }
                    .onDelete { indices in
                        removeGroups(at: indices)
                    }
                }
                NavigationLink("Add Group") {
                    AddExerciseGroupView(exerciseSet: $exerciseSet)
                }
            }
        }
        .navigationTitle("Edit Exercise Set")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    try? modelContext.save()
                }
            }
        }
    }

    private func removeGroups(at offsets: IndexSet) {
        exerciseSet.groups.remove(atOffsets: offsets)
        try? modelContext.save()
    }
}
