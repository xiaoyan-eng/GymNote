//
//  PlanCellView.swift
//  GymNote
//
//  Created by Xiao Yan on 12/26/21.
//

import SwiftUI

struct PlanCellView: View {
    
    var plan: Plan
    let onEditTapped: () -> Void
    let onDeleteTapped: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle().fill(.blue).frame(height: 40)
                Text("Back, Chest").foregroundColor(.white).bold()
            }
            HStack {
                Text(plan.name).padding()
                Spacer()
                ZStack {
                    Rectangle().fill(.clear).frame(width: 20, height: 50, alignment: .center)
                    Image(systemName: "pencil").foregroundColor(.gray)
                }
                .onTapGesture {
                    onEditTapped()
                }
                ZStack {
                    Rectangle().fill(.clear).frame(width: 20, height: 50, alignment: .center)
                    Image(systemName: "trash").foregroundColor(.red).opacity(0.5)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                .onTapGesture {
                    onDeleteTapped()
                }
            }
        }
        .border(.blue, width: 2)
    }
}

struct PlanCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlanCellView(plan: .init(id: "", name: "", state: .pending, startTime: .now, endTime: nil, exercises: .init()), onEditTapped: {}, onDeleteTapped: {})
    }
}
