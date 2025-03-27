//
//  ContentView.swift
//  SideMenuTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack{
            ZStack {
                //Change this to NavigationStack (maybe NavLink)
               /*TabView (selection: $selectedTab,
                         content:  {
                    Text("Dashboard").tag(0)
                    Text("Performance").tag(1)
                    Text("Profile").tag(2)
                    Text("Search").tag(3)
                    Text("Notifications").tag(4)
                })*/
                Text("Home Page")

                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden: .visible, for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding()
        }
        
        
    }
}

#Preview {
    ContentView()
}
