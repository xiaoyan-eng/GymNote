//
//  DashboardView.swift
//  GymNote
//
//  Created by Xiao Yan on 10/31/21.
//

import SwiftUI
import RealmSwift

struct DashboardView: View {
    
    @ObservedObject var viewModel: DashboardViewModel = .init()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
