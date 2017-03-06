//
//  TabsRouter.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

protocol RootRouter: class {
    func showSearchTab()
    func showResumeTab()
}


class TabsRouter: Router {
    fileprivate let assembly: RootAssembly
    
    fileprivate let tabController = UITabBarController()
    fileprivate let resumeRouter: ResumeRouter
    fileprivate let searchRouter: SearchRouter
    
    init(assembly: RootAssembly) {
        self.assembly = assembly
        searchRouter = SearchRouter(assembly: assembly)
        resumeRouter = ResumeRouter(assembly: assembly)
        tabController.viewControllers = [searchRouter.mainController, resumeRouter.mainController]
        
        searchRouter.rootRouter = self
        searchRouter.showMainController()
        resumeRouter.rootRouter = self
        resumeRouter.showResumeController()
    }
    
    //MARK: - Router
    
    var mainController: UIViewController {
        return tabController
    }
}


extension TabsRouter: RootRouter {
    func showSearchTab() {
        tabController.selectedViewController = searchRouter.mainController
    }
    
    func showResumeTab() {
        tabController.selectedViewController = resumeRouter.mainController
    }
}
