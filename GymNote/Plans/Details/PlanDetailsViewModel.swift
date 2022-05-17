//
//  PlanDetailsViewModel.swift
//  GymNote
//
//  Created by Xiao Yan on 12/31/21.
//

import Combine
import RealmSwift

final class PlansDetailsViewModel: ObservableObject {
    

    @Published var existingPlans: [Plan] = try! Realm().objects(WorkoutPlan.self).toArray().compactMap {
        $0.value
    }
    var eventNotificationToken: NotificationToken? = nil
    init() {
//        removeAll()
//        addNewPlan(name: "Test Plan", startTime: .now, endTime: nil)
        addObserver()
        
    }

    func addNewExercise(name: String, startTime: Date, endTime: Date? = nil) {
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
    
    func removeAll() {
        do {
            let realm = try Realm()
            try realm.write {
              realm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
    
    func removePlan(with id: String) {
        do {
            let realm = try Realm()
            try realm.write {
                let plan = realm.objects(WorkoutPlan.self).filter("id == %@", id)
                realm.delete(plan)
            }
        } catch {
            print(error)
        }
    }
    
    func addObserver() {
        let results = try! Realm().objects(WorkoutPlan.self)
        eventNotificationToken = results.observe { [weak self] change in
            switch change {
            case .update(_, _, _, _):
                self?.existingPlans = try! Realm().objects(WorkoutPlan.self).toArray().compactMap {
                    $0.value
                }
            default:
                break
            }
        }
    }
}
