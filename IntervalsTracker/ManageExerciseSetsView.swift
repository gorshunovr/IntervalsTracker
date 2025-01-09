//
//  ManageExerciseSetsView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct ManageExerciseSetsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exerciseSets: [ExerciseSet]

    @State private var newSetName: String = ""
    @State private var editingSet: ExerciseSet? = nil
    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            List {
                ForEach(exerciseSets) { set in
                    NavigationLink(destination: ExerciseSetDetailView(exerciseSet: .constant(set))) {
                        HStack {
                            Text(set.name)
                                .font(.headline)
                            Spacer()
                            Button(role: .destructive) {
                                modelContext.delete(set)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }

            HStack {
                TextField(isEditing ? "Edit Exercise Set" : "New Exercise Set", text: $newSetName)
                    .textFieldStyle(.roundedBorder)
                Button(isEditing ? "Save" : "Add") {
                    if isEditing, let set = editingSet {
                        set.name = newSetName
                        try? modelContext.save()
                        isEditing = false
                        editingSet = nil
                    } else {
                        let newSet = ExerciseSet(name: newSetName, groups: [])
                        modelContext.insert(newSet)
                    }
                    newSetName = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(newSetName.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Manage Exercise Sets")
    }
}
