//
//  AppConfiguration.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        return "https://someBaseURL.com/"
    }()
}
