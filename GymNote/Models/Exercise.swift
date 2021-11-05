//
//  Exercise.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Foundation
import RealmSwift

@objc enum BodyPart: Int {
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

    @objc dynamic var part: BodyPart
    @objc dynamic var name: String
    @objc dynamic var state: WorkoutState
    @objc dynamic var reps: Int
    @objc dynamic var weight: Float

    init(part: BodyPart, name: String) {
        self.part = part
        self.name = name
        self.state = .pending
        self.reps = 12
        self.weight = 0
    }
    
    static let fullList: [Exercise] =
        [
            .init(part: .core, name: NSLocalizedString("Ab Roller", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Aerobics", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Arnold Dumbbell Press", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Around the World", comment: "")),
            .init(part: .back, name: NSLocalizedString("Back Extension", comment: "")),
            .init(part: .back, name: NSLocalizedString("Back Extension - Machine", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Bench Press", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Bench Press - Dumbbell", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Bench Press - Floor", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Bench Press - Machine", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Bicep Curl", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Bicep Curl - Barbell", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Bicep Curl - Dumbell", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Bicep Curl - Machine", comment: "")),
            .init(part: .core, name: NSLocalizedString("Bicycle Crunch", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Box Squat", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Bulgarian Split Squat", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Cable Crossover", comment: "")),
            .init(part: .core, name: NSLocalizedString("Cable Crunch", comment: "")),
            .init(part: .back, name: NSLocalizedString("Cable Row", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Chest Dip", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Chest Dip - Assisted", comment: "")),
            .init(part: .back, name: NSLocalizedString("Chin Up", comment: "")),
            .init(part: .back, name: NSLocalizedString("Chin Up - Assisted", comment: "")),
            .init(part: .others, name: NSLocalizedString("Clean", comment: "")),
            .init(part: .others, name: NSLocalizedString("Clean and Jerk", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Climbing", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Concentration Curl", comment: "")),
            .init(part: .core, name: NSLocalizedString("Crunch", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Cycling", comment: "")),
            .init(part: .back, name: NSLocalizedString("Deadlift", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Decline Bench Press", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Decline Bench Press - Barbell", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Decline Bench Press - Dumbbell", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Decline Bench Press - Machine", comment: "")),
            .init(part: .core, name: NSLocalizedString("Decline Crunch", comment: "")),
            .init(part: .core, name: NSLocalizedString("Exercise Ball Crunch", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Face Pull", comment: "")),
            .init(part: .core, name: NSLocalizedString("Flat Straight Leg Raise", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Front Cable Raise", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Front Raise", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Front Squat", comment: "")),
            .init(part: .back, name: NSLocalizedString("Good Morning", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Hack Squat", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Hammer Curl", comment: "")),
            .init(part: .others, name: NSLocalizedString("Hang Clean", comment: "")),
            .init(part: .others, name: NSLocalizedString("Hang Snatch", comment: "")),
            .init(part: .core, name: NSLocalizedString("Hanging Leg Raise", comment: "")),
            .init(part: .legs, name: NSLocalizedString("High Knees", comment: "")),
            .init(part: .others, name: NSLocalizedString("High Pulls", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Hiking", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Hip Thrust - Barbell", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Hip Thrust - Bodyweight", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Incline Bench Press", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Incline Bench Press - Barbell", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Incline Bench Press - Dumbbell", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Incline Bench Press - Machine", comment: "")),
            .init(part: .core, name: NSLocalizedString("Jackknife", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Jump Rope", comment: "")),
            .init(part: .others, name: NSLocalizedString("Jump Shrug", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Jump Squat", comment: "")),
            .init(part: .others, name: NSLocalizedString("Jumping Jacks", comment: "")),
            .init(part: .back, name: NSLocalizedString("Kipping Pull Up", comment: "")),
            .init(part: .core, name: NSLocalizedString("Knee Raise", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Kneeling Push Up", comment: "")),
            .init(part: .back, name: NSLocalizedString("Lat Pulldown", comment: "")),
            .init(part: .back, name: NSLocalizedString("Lat Pulldown - Single Arm", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Lateral Raise", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Leg Extension", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Leg Press", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Lunge", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Lunge - Barbell", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Lunge - Bodyweight", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Lunge - Dumbbell", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Military Press", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Mountain Climbers", comment: "")),
            .init(part: .core, name: NSLocalizedString("Oblique Crunch", comment: "")),
            .init(part: .others, name: NSLocalizedString("Overhead Squat", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Pectoral Fly", comment: "")),
            .init(part: .back, name: NSLocalizedString("Pendlay Row", comment: "")),
            .init(part: .core, name: NSLocalizedString("Plank", comment: "")),
            .init(part: .others, name: NSLocalizedString("Power Clean", comment: "")),
            .init(part: .others, name: NSLocalizedString("Power Snatch", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Preacher Curl", comment: "")),
            .init(part: .others, name: NSLocalizedString("Press Under", comment: "")),
            .init(part: .back, name: NSLocalizedString("Pull Up", comment: "")),
            .init(part: .back, name: NSLocalizedString("Pull Up - Assisted", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Push Press", comment: "")),
            .init(part: .chest, name: NSLocalizedString("Push Up", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Reverse Crunch", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Reverse Curl", comment: "")),
            .init(part: .back, name: NSLocalizedString("Romanian Deadlift", comment: "")),
            .init(part: .back, name: NSLocalizedString("Rowing", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Running", comment: "")),
            .init(part: .core, name: NSLocalizedString("Russian Twist", comment: "")),
            .init(part: .back, name: NSLocalizedString("Seated Row", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shoulder Press", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shoulder Press - Barbell", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shoulder Press - Dumbbell", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shoulder Press - Machine", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shrug", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shrug - Barbell", comment: "")),
            .init(part: .shoulders, name: NSLocalizedString("Shrug - Dumbbell", comment: "")),
            .init(part: .core, name: NSLocalizedString("Side Plank", comment: "")),
            .init(part: .core, name: NSLocalizedString("Sit Up", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Skating", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Skiing", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Skullcrushers", comment: "")),
            .init(part: .others, name: NSLocalizedString("Snatch", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Snowboarding", comment: "")),
            .init(part: .others, name: NSLocalizedString("Split Jerk", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Squat", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Squat - Barbell", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Squat - Bodyweight", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Squat - Dumbbell", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Squat - Machine", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Standing Calf Raise", comment: "")),
            .init(part: .legs, name: NSLocalizedString("Standing Calf Raise - Machine", comment: "")),
            .init(part: .back, name: NSLocalizedString("Stiff Legged Deadlift", comment: "")),
            .init(part: .others, name: NSLocalizedString("Stretching", comment: "")),
            .init(part: .back, name: NSLocalizedString("Sumo Deadlift", comment: "")),
            .init(part: .core, name: NSLocalizedString("Superman", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Swimming", comment: "")),
            .init(part: .back, name: NSLocalizedString("T Bar Row", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Tricep Dip", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Tricep Extension", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Tricep Extension - Barbell", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Tricep Extension - Dumbbell", comment: "")),
            .init(part: .arms, name: NSLocalizedString("Tricep Extension - Machine", comment: "")),
            .init(part: .back, name: NSLocalizedString("Upright Barbell Row", comment: "")),
            .init(part: .core, name: NSLocalizedString("V-Up", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Walking", comment: "")),
            .init(part: .core, name: NSLocalizedString("Woodchoppers", comment: "")),
            .init(part: .cardio, name: NSLocalizedString("Yoga", comment: ""))
        ]
}
