//
//  SideMenuOptionModel.swift
//  SideMenuTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case map
    case notifications
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .map:
            return "Map"
        case .notifications:
            return "Notifications"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .map:
            return "map"
        case .notifications:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue }
}
