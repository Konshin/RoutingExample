//
//  MainSearchController.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class SearchFilterController: TestController {
    let vm: SearchFilterVM
    
    init(vm: SearchFilterVM) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(done)
        )
    }
    
    func done() {
        dismiss(animated: true, completion: nil)
        vm.done()
    }
}
