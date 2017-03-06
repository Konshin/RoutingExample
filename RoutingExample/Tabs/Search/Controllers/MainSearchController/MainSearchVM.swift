//
//  MainSearchVM.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import Foundation

class MainSearchVM: SearchSuggestsDelegate {
    private let router: SearchRouter
    private let profileFacade: ProfileFacade
    
    init(router: SearchRouter, profileFacade: ProfileFacade) {
        self.router = router
        self.profileFacade = profileFacade
    }
    
    func showSuggest() {
        router.showSuggests(delegate: self)
    }
    
    func showResults(filter: Filter) {
        router.showResults(filter: filter)
    }
    
    func searchSuggestsDidPopulateFilter(viewModel: SearchSuggestsVM, filter: Filter) {
        self.showResults(filter: filter)
    }
}
