//
//  PlansViewModel.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import SwiftUI
import RealmSwift

final class PlansSearchViewModel: ObservableObject {
    @Published var selectedBodyParts: [BodyPart] = Constants.allParts
    @Published var searchText: String = ""
    
    var exercises: [WorkoutExercise] {
        let exercises = exercises(with: selectedBodyParts)
        guard searchText != "" else {
            return exercises
        }
        return exercises.filter { $0.name.contains(searchText) }
    }
    
    func exercises(with bodyParts: [BodyPart]) -> [WorkoutExercise] {
        return Constants.fullList.filter { bodyParts.contains($0.part) }
    }
}
