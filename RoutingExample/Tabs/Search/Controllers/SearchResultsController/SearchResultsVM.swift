//
//  MainSearchVM.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import Foundation

class SearchResultsVM: SearchFilterDelegate {
    private let router: SearchRouter
    private var filter: Filter
    
    init(router: SearchRouter, filter: Filter) {
        self.router = router
        self.filter = filter
    }
    
    func showFilter() {
        router.showFilter(filter: filter, delegate: self)
    }
    
    func searchFilterDidUpdateFilter(viewModel: SearchFilterVM, filter: Filter) {
        self.filter = filter
        router.hideFilter(animated: true)
    }
}
