//
//  WorkoutPlan.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import RealmSwift

class WorkoutPlan: Object, Identifiable {
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var state: WorkoutState
    @objc dynamic var startTime: Date
    @objc dynamic var endTime: Date?
    var exercises: List<Exercise> = .init()

    init(name: String, startTime: Date, endTime: Date?) {
           self.id = UUID().uuidString
           self.name = name
           self.state = .pending
           self.startTime = startTime
           self.endTime = endTime
    }
    
    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
}
