//
//  SideMenuRowView.swift
//  SideMenuTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selected: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selected == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            
            Text(option.title)
                .font(.subheadline)
        
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 216, height:44)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
}



#Preview {
    SideMenuRowView(option: .dashboard, selected: .constant(.dashboard))
}
