//
//  MainTabView.swift
//  GymNote
//
//  Created by Xiao Yan on 10/31/21.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            DashboardView()
                .tabItem {
                    if selection == 0 {
                        Image(systemName: "checklist")
                    } else {
                        Image(systemName: "checklist")
                    }
                    
                    Text("Current")
                }
                .tag(0)
            
            PlansView()
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    } else {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    }
                    
                    Text("Plans")
                }
                .tag(1)

            SummaryView()
                .tabItem {
                    if selection == 2 {
                        Image(systemName: "chart.xyaxis.line")
                    } else {
                        Image(systemName: "chart.xyaxis.line")
                    }
                    
                    Text("Summary")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    if selection == 3 {
                        Image(systemName: "gear")
                    } else {
                        Image(systemName: "gear")
                    }
                    
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
