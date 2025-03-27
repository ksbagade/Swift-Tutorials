//
//  HomeView.swift
//  MapTutorial
//
//  Created by Kaveri Bagade on 5/21/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
