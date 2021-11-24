//
//  PlansHomeView.swift
//  GymNote
//
//  Created by Xiao Yan on 11/14/21.
//

import SwiftUI

struct PlansHomeView: View {
    @ObservedObject var viewModel: PlansHomeViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.existingPlans) { plan in
                    Text(plan.name)
                        .listRowSeparator(.hidden)
                }
            }
            .searchable(text: $viewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search Exercise")
            .navigationTitle("Exercises")
        }
        .navigationViewStyle(.stack)
    }
}

struct PlansHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlansHomeView()
    }
}
