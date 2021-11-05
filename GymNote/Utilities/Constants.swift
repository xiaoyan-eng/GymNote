//
//  Constants.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import RealmSwift

@objc enum WorkoutState: Int, RealmEnum {
    case done
    case failed
    case paused
    case pending
    case running
}
