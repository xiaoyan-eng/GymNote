//
//  WorkoutPlan.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import RealmSwift

class WorkoutPlan: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var state: WorkoutState = .pending
    @objc dynamic var startTime: Date = .now
    @objc dynamic var endTime: Date? = nil
    var exercises: List<WorkoutExercise> = .init()
    
    var value: Plan {
        .init(
            id: self.id,
            name: self.name,
            state: self.state,
            startTime: self.startTime,
            endTime: self.endTime,
            exercises: self.exercises
        )
    }
    
    convenience init(name: String, startTime: Date, endTime: Date?) {
        self.init()
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func addExercise(_ exercise: WorkoutExercise) {
        exercises.append(exercise)
    }
}

struct Plan: Identifiable {
    let id: String
    var name: String
    var state: WorkoutState
    var startTime: Date
    var endTime: Date?
    var exercises: List<WorkoutExercise>
    
    static func ==(lhs: Plan, rhs: Plan?) -> Bool {
        lhs.id == rhs?.id
    }
}
