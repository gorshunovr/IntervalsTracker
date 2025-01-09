//
//  LogBookScreen.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftUI
import SwiftData

struct LogBookScreen: View {
    @Query private var logEntries: [LogBookEntry]

    var body: some View {
        List(logEntries) { log in
            VStack(alignment: .leading) {
                Text(log.exerciseSetName)
                    .font(.headline)

                HStack {
                    Text("Start: \(log.startDate.formatted())")
                    if let endDate = log.endDate {
                        Text("End: \(endDate.formatted())")
                    }
                }
                .font(.caption)
                .foregroundColor(.secondary)

                if log.interrupted {
                    Text("Session Interrupted")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("LogBook")
    }
}
