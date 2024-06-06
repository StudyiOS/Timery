//
//  TimeEntryVC.swift
//
//
//  Created by 정준영 on 6/6/24.
//

import UIKit
import JimmyKit

final class TimeEntryVC: UIViewController {
    
    let label = UILabel()
        .text("Time Entry")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    TimeEntryVC()
}
