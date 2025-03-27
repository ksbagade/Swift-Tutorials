//
//  SideMenuHeaderView.swift
//  SideMenuTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading){
                Text("Kaveri Bagade")
                    .font(.subheadline)
                
                Text("test@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
                
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
