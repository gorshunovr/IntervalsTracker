//
//  ManageExerciseGroupsView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct ManageExerciseGroupsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exerciseGroups: [ExerciseGroup]

    @State private var newGroupName: String = ""
    @State private var editingGroup: ExerciseGroup? = nil
    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            List {
                ForEach(exerciseGroups) { group in
                    NavigationLink(destination: ExerciseGroupDetailView(exerciseGroup: .constant(group))) {
                        HStack {
                            Text(group.name)
                                .font(.headline)
                            Spacer()
                            Button(role: .destructive) {
                                modelContext.delete(group)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }

            HStack {
                TextField(isEditing ? "Edit Exercise Group" : "New Exercise Group", text: $newGroupName)
                    .textFieldStyle(.roundedBorder)
                Button(isEditing ? "Save" : "Add") {
                    if isEditing, let group = editingGroup {
                        group.name = newGroupName
                        try? modelContext.save()
                        isEditing = false
                        editingGroup = nil
                    } else {
                        let newGroup = ExerciseGroup(name: newGroupName, exercises: [])
                        modelContext.insert(newGroup)
                    }
                    newGroupName = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(newGroupName.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Manage Exercise Groups")
    }
}
