//
//  ReportsVC.swift
//  Timery
//
//  Created by Leo on 2024/06/23
//

import UIExtension

public enum ReportsFactory {
    public static func create(
        with coordinator: ReportsFlowCoordinatorProtocol
    ) -> UIViewController {
        let vc = ReportsVC()
        vc.reactor = ReportsReactor(coordinator: coordinator)
        return vc
    }
}

final class ReportsVC: UIViewController, View {
    var disposeBag: DisposeBag = DisposeBag()
    
    let titleLabel = UILabel().then {
        $0.text = "Reports"
        $0.textColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        [titleLabel].forEach(view.addSubview)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func bind(reactor: ReportsReactor) {
        
    }
}

extension ReportsVC: Bindable {
    
    func bindState(_ reactor: Reactor) {
        
    }
    
    func bindAction(_ reactor: Reactor) {
        
    }
}

