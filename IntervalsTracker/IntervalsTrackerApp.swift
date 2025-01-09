//
//  IntervalsTrackerApp.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

//
//  IntervalsTrackerApp.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

@main
struct IntervalsTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        // Define the schema with your models
        let schema = Schema([
            Exercise.self,
            ExerciseGroup.self,
            ExerciseSet.self,
            LogBookEntry.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            // Initialize the ModelContainer for persistence
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
