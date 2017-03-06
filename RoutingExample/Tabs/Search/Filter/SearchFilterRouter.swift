//
//  SearchFilterRouter.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 06.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class SearchFilterRouter: Router {
    private let assembly: RootAssembly
    fileprivate let navController = UINavigationController()
    
    init(assembly: RootAssembly) {
        self.assembly = assembly
    }
    
    //MARK: - Router
    
    var mainController: UIViewController {
        return navController
    }
    
    //MARK: - present
    
    func showFilterEditor(filter: Filter, delegate: SearchFilterDelegate) {
        let vc = assembly.filtersController(filter: filter, delegate: delegate)
        navController.viewControllers = [vc]
    }
}
