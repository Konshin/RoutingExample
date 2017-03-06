//
//  ResumeRouter.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class ResumeRouter: Router {
    private let assembly: RootAssembly
    fileprivate let navController = UINavigationController()
    
    weak var rootRouter: RootRouter?
    
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
    
    //MARK: - comtrollers
    
    func showResumeController() {
        let vc = assembly.mainResumeController(router: self)
        navController.viewControllers = [vc]
    }
}
