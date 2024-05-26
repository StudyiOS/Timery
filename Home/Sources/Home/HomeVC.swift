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
    private var moveTestButton: UIButton!
    
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
        
        moveTestButton = .init().then {
            $0.setTitle("디테일 페이지로 이동", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
        
        moveTestButton.addTarget(
            self,
            action: #selector(moveTestButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        [welcomeLabel, moveTestButton].forEach(view.addSubview)
        
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        moveTestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-12)
        }
    }
    
    @objc private func moveTestButtonTapped() {
        viewModel.showTestDetail()
    }
}

#if DEBUG
#Preview {
    
    HomeVC(viewModel: .init(coordinator: MockHomeFlowCoordinator()))
}


final class MockHomeFlowCoordinator: HomeFlowCoordinatorProtocol {
    func start() {}
    func showTestDetail() {}
}
#endif
