//
//  SettingsScreen.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack {
            Picker("Manage", selection: $selectedTab) {
                Text("Sets").tag(0)
                Text("Groups").tag(1)
                Text("Exercises").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedTab == 0 {
                ManageExerciseSetsView()
            } else if selectedTab == 1 {
                ManageExerciseGroupsView()
            } else {
                ManageExercisesView()
            }
        }
        .navigationTitle("Settings")
    }
}
