//
//  TimeEntriesViewController.swift
//  Timery
//
//  Created by Leo on 2024/06/23
//

import UIKit
import Then
import SnapKit

public enum TimeEntriesFactory {
    public static func create(
        with coordinator: TimeEntriesFlowCoordinatorProtocol
    ) -> UIViewController {
        let vm = TimeEntriesVM(coordinator: coordinator)
        let vc = TimeEntriesVC(viewModel: vm)
        return vc
    }
}

class TimeEntriesVC: UIViewController {
    
    private let viewModel: TimeEntriesVM
    
    init(viewModel: TimeEntriesVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel().then {
        $0.text = "TimeEntries"
        $0.textColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        [titleLabel].forEach(view.addSubview)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
