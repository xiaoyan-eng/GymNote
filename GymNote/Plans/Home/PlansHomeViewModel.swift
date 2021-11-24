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
}
