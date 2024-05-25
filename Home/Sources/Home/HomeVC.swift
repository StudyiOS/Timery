//
//  HomeViewController.swift
//
//
//  Created by Leo on 5/25/24.
//

import UIKit
import SnapKit
import Then
import ViewExtension

public final class HomeVC: BaseVC {
    
    private let viewModel: HomeVM
    
    private var welcomeLabel: UILabel!
    
    public init(viewModel: HomeVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        buildComponents()
        configureUI()
    }
    
    private func buildComponents() {
        welcomeLabel = .init().then {
            $0.text = viewModel.welcomeText
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        [welcomeLabel].forEach(view.addSubview)
        
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

#if DEBUG
#Preview {
    
    HomeVC(viewModel: .init(coordinator: MockHomeFlowCoordinator()))
}


final class MockHomeFlowCoordinator: HomeFlowCoordinatorProtocol {
    func start() {}
    func showSettings() {}
}
#endif
