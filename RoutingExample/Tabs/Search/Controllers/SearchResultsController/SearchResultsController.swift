//
//  MainSearchController.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class SearchResultsController: TestController {
    let vm: SearchResultsVM
    
    init(vm: SearchResultsVM) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Show filter",
            style: .plain,
            target: self,
            action: #selector(showFilter)
        )
    }
    
    func showFilter() {
        vm.showFilter()
    }
}
