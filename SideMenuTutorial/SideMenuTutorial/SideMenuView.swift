//
//  SideMenuView.swift
//  SideMenuTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State private var selectedOption: SideMenuOptionModel?
    @Binding var selectedTab: Int
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        // Dashboard Button
                        NavigationLink {
                            DetailView(text: "Dashboard")
                        } label: {
                            SideMenuRowView(option: SideMenuOptionModel.dashboard, selected: $selectedOption)
                        }
                        
                        // Performance Button
                        NavigationLink {
                            DetailView(text: "Performance")
                        } label: {
                            SideMenuRowView(option: SideMenuOptionModel.performance, selected: $selectedOption)
                        }
                        
                        // Map Button
                        NavigationLink {
                            MapViewRepresentable()
                        } label: {
                            SideMenuRowView(option: SideMenuOptionModel.map, selected: $selectedOption)
                        }
                        
                        // Notifications Button
                        NavigationLink {
                            DetailView(text: "Notifications")
                        } label: {
                            SideMenuRowView(option: SideMenuOptionModel.notifications, selected: $selectedOption)
                        }
                        


                        
                        /*VStack {
                            
                            ForEach(SideMenuOptionModel.allCases) {
                                option in
                                NavigationLink {
                                    let _ = onOptionTapped(option)
                                    MapViewRepresentable()
                                } label: {
                                    SideMenuRowView(option: option, selected: $selectedOption)
                                }
                            }
                        }*/
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(colorScheme == .dark ? .black : .white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    private func onOptionTapped(_ option : SideMenuOptionModel) {
        selectedOption = option
        debugPrint(option.title)
        selectedTab = option.rawValue
        isShowing = false
    }
}

struct DetailView: View {
    let text: String
    var body: some View {
        VStack {
            Text("Detail view showing")
            Text(text)
        }
        .navigationTitle(text)
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
