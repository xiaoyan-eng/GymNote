//
//  PlansHomeViewModel.swift
//  GymNote
//
//  Created by Xiao Yan on 11/14/21.
//

import Combine
import RealmSwift

final class PlansHomeViewModel: ObservableObject {
    @Published var existingPlans: [WorkoutPlan] = try! Realm().objects(WorkoutPlan.self).toArray()
    
    init() {
        addNewPlan(name: "Test Plan", startTime: .now, endTime: nil)
    }

    func addNewPlan(name: String, startTime: Date, endTime: Date? = nil) {
        let plan = WorkoutPlan(name: name, startTime: startTime, endTime: endTime)
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(plan)
            }
        } catch {
            print(error)
        }
    }
}
