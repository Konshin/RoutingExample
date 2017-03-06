//
//  SearchRouter.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class SearchRouter: Router {
    private let assembly: RootAssembly
    fileprivate let navController = UINavigationController()
    
    weak var rootRouter: RootRouter?
    private var filterRouter: SearchFilterRouter?
    
    init(assembly: RootAssembly) {
        self.assembly = assembly
    }
    
    func returnToRoot(animated: Bool) {
        navController.popToRootViewController(animated: animated)
    }
    
    //MARK: - Router
    
    var mainController: UIViewController {
        return navController
    }
    
    //MARK: - actions
    
    func showMainController() {
        let vc = assembly.mainSearchController(router: self)
        navController.viewControllers = [vc]
    }
    
    func showSuggests(delegate: SearchSuggestsDelegate) {
        let vc = assembly.suggestsController(delegate: delegate)
        navController.pushViewController(vc, animated: true)
    }
    
    func showResults(filter: Filter) {
        let vc = assembly.searchResultsController(filter: filter, router: self)
        navController.pushViewController(vc, animated: true)
    }
    
    func showFilter(filter: Filter, delegate: SearchFilterDelegate) {
        if filterRouter != nil {
            hideFilter(animated: false)
        }
        let router = SearchFilterRouter(assembly: assembly)
        router.showFilterEditor(filter: filter, delegate: delegate)
        navController.present(router.mainController, animated: true, completion: nil)
        filterRouter = router
    }
    
    func hideFilter(animated: Bool = true) {
        if let router = filterRouter {
            router.mainController.dismiss(animated: true, completion: nil)
            filterRouter = nil
        }
    }
    
    //MARK: private
    
    private func showVC(_ vc: UIViewController, segue: RouterSegue, animated: Bool) {
        switch segue {
        case .present:
            navController.present(vc, animated: animated, completion: nil)
        case .push:
            navController.pushViewController(vc, animated: animated)
        }
    }
}
