//
//  ReportsReactor.swift
//
//
//  Created by Leo on 6/23/24.
//

import UIExtension

final class ReportsReactor: Reactor {
    enum Action {
        
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    let initialState = State()
    
    private let coordinator: ReportsFlowCoordinatorProtocol

    init(coordinator: ReportsFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        switch mutation {
            
        }
    }
}
