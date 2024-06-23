//
//  Relay+.swift
//  
//
//  Created by Leo on 6/23/24.
//


import UIKit
import RxSwift
import RxCocoa

public extension BehaviorRelay where Element == String {
    func drive(to label: UILabel, disposedBy disposeBag: DisposeBag) {
        self.asDriver()
            .distinctUntilChanged()
            .drive(label.rx.text)
            .disposed(by: disposeBag)
    }
}
