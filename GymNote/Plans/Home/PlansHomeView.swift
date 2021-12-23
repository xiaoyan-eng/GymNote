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
                    NavigationLink {
                        PlansSearchView()
                    } label: {
                    Text(plan.name)
                        .listRowSeparator(.hidden)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct PlansHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlansHomeView()
    }
}
