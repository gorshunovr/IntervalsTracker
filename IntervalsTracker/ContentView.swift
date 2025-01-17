//
//  ContentView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  ContentView.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exerciseSets: [ExerciseSet]

    var body: some View {
        NavigationView {
            VStack {
                List(exerciseSets) { set in
                    NavigationLink(destination: ExerciseScreen(exerciseSet: set)) {
                        VStack(alignment: .leading) {
                            Text(set.name)
                                .font(.headline)
                            if let comment = set.comment {
                                Text(comment)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
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

#Preview {
    ContentView()
        .modelContainer(for: ExerciseSet.self, inMemory: true)
}
