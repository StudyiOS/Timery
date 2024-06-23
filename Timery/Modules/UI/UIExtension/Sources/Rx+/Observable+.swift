//
//  Observable+.swift
//  
//
//  Created by Leo on 6/23/24.
//

import UIKit
import RxSwift
import RxCocoa

extension Observable where Element ==  String {
    func drive(to label: UILabel, disposedBy disposeBag: DisposeBag) {
        self
            .asDriver(onErrorJustReturn: "")
            .distinctUntilChanged()
            .drive(label.rx.text)
            .disposed(by: disposeBag)
    }
}
