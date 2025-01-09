//
//  MainScreen.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct MainScreen: View {
    @Query private var exerciseSets: [ExerciseSet]
    @State private var selectedExerciseSet: ExerciseSet?

    var body: some View {
        NavigationView {
            VStack {
                List(exerciseSets) { set in
                    Button(action: { selectedExerciseSet = set }) {
                        Text(set.name)
                            .font(.headline)
                    }
                }
                .navigationTitle("Exercise Sets")

                HStack {
                    NavigationLink(destination: SettingsScreen()) {
                        Text("Settings")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding()

                    NavigationLink(destination: LogBookScreen()) {
                        Text("LogBook")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
