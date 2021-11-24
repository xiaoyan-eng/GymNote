//
//  PlansView.swift
//  GymNote
//
//  Created by Xiao Yan on 11/4/21.
//

import Combine
import SwiftUI

struct PlansSearchView: View {
    
    @ObservedObject var viewModel: PlansSearchViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.exercises) { exercise in
                    Text(exercise.name)
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

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        PlansSearchView()
    }
}
