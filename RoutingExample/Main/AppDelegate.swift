//
//  AppDelegate.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

/*
      +-----------------------------------------------------------------------+
      |                                                                       |
   +--+                               Assembly                                +--+
   |  |                                                                       |  |
   |  +------------------------+-----------------------------------------+----+  |
   |                           ^                                         ^       |
   |                           |                                         |       |
   |  +------------------------+------------------------+           +----+----+  |
   |  |                                                 |           |         |  |
   |  |                     Router1                     +---------->+ Router2 |  |
   |  |                                                 |           |         |  |
   |  +---+--------------------+--------------------+---+           +----+----+  |
   |      ^                    ^                    ^                    ^       |
 +-+ --+  |  +--   ---   ---+  |  +--   ---   ---+  |  +--   ---   ---+  |  +-- -+-+
 |        |                    |                    |                    |         |
 |    +---+---+            +---+---+            +---+---+            +---+---+     |
      |       |  delegate  |       |  delegate  |       |  delegate  |       |
      |  VM1  +<--  --  ---+  VM2  +<--  --  ---+  VM3  +<--  --  ---+  VM4  |
 |    |       |            |       |            |       |            |       |     |
 |    +---+---+            +---+---+            +---+---+            +---+---+     |
          ^                    ^                    ^                    ^
          |                    |                    |                    |
 |    +---+---+            +-- +---+            +---+---+            +---+---+     |
 |    |       |            |       |            |       |            |       |     |
      |  VC1  |            |  VC2  |            |  VC3  |            |  VC4  |
      |       |            |       |            |       |            |       |
 |    +-------+            +-------+            +-------+            +-------+     |
 |                                                                                 |
 +---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---   ---+
 
                                Создает Assembly
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var tabsRouter: TabsRouter = TabsRouter(assembly: self.assembly)
    private let assembly = RootAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabsRouter.mainController
        self.window?.makeKeyAndVisible()
        
        tabsRouter.showSearchTab()
        
        return true
    }
}

