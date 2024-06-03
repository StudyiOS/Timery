//
//  TimeryTab.swift
//
//
//  Created by Leo on 6/2/24.
//

import UIKit

public enum TimeryTab: CaseIterable {
    
    case savedTimers
    case timeEntries
    case reports
    case settings
    
    var tabTitle: String {
        switch self {
        case .savedTimers: "Saved Timers"
        case .timeEntries: "Time Entries"
        case .reports: "Reports"
        case .settings: "Settings"
        }
    }
    
    var tabIcon: UIImage {
        switch self {
        case .savedTimers: UIImage(systemName: "play.circle.fill")!
        case .timeEntries: UIImage(systemName: "list.bullet")!
        case .reports: UIImage(systemName: "chart.bar.xaxis")!
        case .settings: UIImage(systemName: "gear")!
        }
    }
}
