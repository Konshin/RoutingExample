//
//  MainSearchVM.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import Foundation

protocol SearchFilterDelegate: class {
    func searchFilterDidUpdateFilter(viewModel: SearchFilterVM, filter: Filter)
}

class SearchFilterVM {
    private let locationFacade: LocationFacade
    private let anyFacade: AnyTempFacade
    private let filter: Filter
    private weak var delegate: SearchFilterDelegate?
    
    init(filter: Filter, locationFacade: LocationFacade, anyFacade: AnyTempFacade, delegate: SearchFilterDelegate) {
        self.delegate = delegate
        self.filter = filter
        self.locationFacade = locationFacade
        self.anyFacade = anyFacade
    }
    
    func done() {
        delegate?.searchFilterDidUpdateFilter(viewModel: self, filter: filter)
    }
}
