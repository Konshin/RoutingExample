//
//  MainSearchVM.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import Foundation

typealias Filter = NSObject

protocol SearchSuggestsDelegate: class {
    func searchSuggestsDidPopulateFilter(viewModel: SearchSuggestsVM, filter: Filter)
}

class SearchSuggestsVM {
    private let locationFacade: LocationFacade
    private weak var delegate: SearchSuggestsDelegate?
    
    init(locationFacade: LocationFacade, delegate: SearchSuggestsDelegate) {
        self.delegate = delegate
        self.locationFacade = locationFacade
    }
    
    func done() {
        delegate?.searchSuggestsDidPopulateFilter(viewModel: self, filter: Filter())
    }
}
