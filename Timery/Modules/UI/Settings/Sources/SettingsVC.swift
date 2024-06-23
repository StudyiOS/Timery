//
//  SettingsViewController.swift
//  Timery
//
//  Created by Leo on 2024/06/23
//

import UIKit
import Then
import SnapKit

public enum SettingsFactory {
    public static func create(
        with coordinator: SettingsFlowCoordinatorProtocol
    ) -> UIViewController {
        let vm = SettingsVM(coordinator: coordinator)
        let vc = SettingsVC(viewModel: vm)
        return vc
    }
}

class SettingsVC: UIViewController {
    
    private let viewModel: SettingsVM
    
    init(viewModel: SettingsVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel().then {
        $0.text = "Settings"
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
