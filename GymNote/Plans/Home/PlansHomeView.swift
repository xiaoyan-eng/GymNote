//
//  PlansHomeView.swift
//  GymNote
//
//  Created by Xiao Yan on 11/14/21.
//

import SwiftUI
import SwiftyJSON

struct PlansHomeView: View {
    @ObservedObject var viewModel: PlansHomeViewModel = .init()
    @State var showAlert: Bool = false
    @State var deletingPlan: Plan?
    @State var seletedPlan: Plan? {
        didSet {
            if let plan = seletedPlan {
                editPlan = plan
            }
        }
    }
    @State var editPlan: Plan = .init(id: "", name: "", state: .pending, startTime: .now, endTime: nil, exercises: .init())
    @State var editingPlanID: String? = nil
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach($viewModel.existingPlans) { $plan in
                        ZStack {
                            NavigationLink(
                                destination: PlanDetailsView(plan: $plan),
                                tag: plan.id,
                                selection: $editingPlanID) {
                                    EmptyView()
                                }
                                .opacity(0)
                                .disabled(editingPlanID != plan.id)
                            PlanCellView(
                                plan: plan,
                                onEditTapped: {
                                    editingPlanID = plan.id
                                },
                                onDeleteTapped: {
                                    startDeletion(plan)
                                }
                            )
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
                Section {
                    Text("**Add New Plan**")
                        .padding(10)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .listRowBackground(Color.blue)
                        .background(NavigationLink("", destination: PlanDetailsView(plan: $editPlan)).opacity(0))
                }
            }
            .navigationTitle("Current Plans")
        }
        .navigationViewStyle(.stack)
        .alert("Want to delete this plan?", isPresented: $showAlert) {
            Button("No", role: .cancel) {}
            Button("Yes", role: .destructive) {
                delete()
            }
        }
    }

    func startDeletion(_ plan: Plan) {
        showAlert = true
        deletingPlan = plan
        
    }
    
    func delete() {
        showAlert = false
        if let plan = deletingPlan {
            viewModel.removePlan(with: plan.id)
            deletingPlan = nil
        }
    }
}

struct PlansHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlansHomeView()
    }
}
