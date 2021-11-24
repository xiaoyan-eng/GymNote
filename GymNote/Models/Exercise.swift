//
//  Exercise.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import RealmSwift

@objc enum BodyPart: Int, RealmEnum {
    case arms
    case back
    case cardio
    case chest
    case core
    case legs
    case shoulders
    case others

    var stringValue: String {
        switch self {
        case .arms:
            return NSLocalizedString("Arms", comment: "")
        case .back:
            return NSLocalizedString("Back", comment: "")
        case .cardio:
            return NSLocalizedString("Cardio", comment: "")
        case .chest:
            return NSLocalizedString("Chest", comment: "")
        case .core:
            return NSLocalizedString("Core", comment: "")
        case .legs:
            return NSLocalizedString("Legs", comment: "")
        case .shoulders:
            return NSLocalizedString("Shoulders", comment: "")
        case .others:
            return NSLocalizedString("Others", comment: "")
        }
    }
}

class Exercise: Object, Identifiable {

    @objc dynamic var part: BodyPart = .others
    @objc dynamic var name: String = ""
    @objc dynamic var state: WorkoutState = .pending
    @objc dynamic var reps: Int = 12
    @objc dynamic var weight: Float = 0

    convenience init(part: BodyPart, name: String) {
        self.init()
        self.part = part
        self.name = name
    }
}
