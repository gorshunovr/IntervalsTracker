//
//  Item.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import SwiftData
import Foundation

// MARK: - Exercise
@Model
final class Exercise {
    var name: String
    var length: TimeInterval? // Optional: length in seconds
    var repetitions: Int
    var weight: Double // Weight in kg
    var restAfter: TimeInterval // Rest time after this exercise
    var comment: String?

    init(
        name: String,
        length: TimeInterval? = nil,
        repetitions: Int = 1,
        weight: Double = 0.0,
        restAfter: TimeInterval = 60.0,
        comment: String? = nil
    ) {
        self.name = name
        self.length = length
        self.repetitions = repetitions
        self.weight = weight
        self.restAfter = restAfter
        self.comment = comment
    }
}

// MARK: - ExerciseGroup
@Model
final class ExerciseGroup {
    var name: String
    var exercises: [Exercise]
    var repetitions: Int
    var restAfter: TimeInterval // Rest after the group
    var comment: String?

    init(
        name: String,
        exercises: [Exercise],
        repetitions: Int = 1,
        restAfter: TimeInterval = 0.0,
        comment: String? = nil
    ) {
        self.name = name
        self.exercises = exercises
        self.repetitions = repetitions
        self.restAfter = restAfter
        self.comment = comment
    }
}

// MARK: - ExerciseSet
@Model
final class ExerciseSet {
    var name: String
    var groups: [ExerciseGroup]
    var comment: String?

    init(
        name: String,
        groups: [ExerciseGroup],
        comment: String? = nil
    ) {
        self.name = name
        self.groups = groups
        self.comment = comment
    }
}

// MARK: - LogBookEntry
@Model
final class LogBookEntry {
    var exerciseSetName: String
    var startDate: Date
    var endDate: Date?
    var interrupted: Bool

    init(
        exerciseSetName: String,
        startDate: Date,
        endDate: Date? = nil,
        interrupted: Bool = false
    ) {
        self.exerciseSetName = exerciseSetName
        self.startDate = startDate
        self.endDate = endDate
        self.interrupted = interrupted
    }
}
