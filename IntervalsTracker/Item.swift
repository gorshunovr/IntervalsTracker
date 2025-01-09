//
//  Item.swift
//  IntervalsTracker
//
//  Created by Roman Gorshunov on 09/01/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
