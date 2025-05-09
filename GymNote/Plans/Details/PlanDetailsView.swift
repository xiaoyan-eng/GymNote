//
//  PlanDetailsView.swift
//  GymNote
//
//  Created by Xiao Yan on 12/31/21.
//

import SwiftUI
import RealmSwift

struct PlanDetailsView: View {
    @Binding var plan: Plan
    @State var count = 0
    
    var body: some View {
        List {
            ForEach(plan.exercises) { exercise in
                Text(exercise.name)
                    .listRowSeparator(.hidden)
            }
        }
        .navigationTitle(plan.name)
        Text(plan.name)
        Button("Change") {
            count += 1
            plan.name = "new name \(count)"
        }
    }
}

struct PlanDetailsView_Previews: PreviewProvider {
    @State static var plan: Plan = Plan(id: "", name: "", state: .pending, startTime: .now, endTime: nil, exercises: .init())
    static var previews: some View {
        PlanDetailsView(plan: $plan)
    }
}
