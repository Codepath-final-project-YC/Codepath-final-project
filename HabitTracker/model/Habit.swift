//
//  Habit.swift
//  HabitTracker
//
//  Created by Yike Li on 12/12/20.
//

import Foundation

struct Habit: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var category: String
    var color: Int
    var percentage: Float
    var active: Bool

}
