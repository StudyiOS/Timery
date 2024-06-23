//
//  Bindable.swift
//
//
//  Created by Leo on 6/23/24.
//

import Foundation

public protocol Bindable {
    associatedtype Reactor: ReactorKit.Reactor
    func bindState(_ reactor: Reactor)
    func bindAction(_ reactor: Reactor)
}
