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
    var exercises: List<Exercise> = .init()
    
    convenience init(name: String, startTime: Date, endTime: Date?) {
        self.init()
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
}
