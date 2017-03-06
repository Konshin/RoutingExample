//
//  ViewController+Iam.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    deinit {
        print("\(key) deinit")
    }
    
    private var key: String {
        let className = type(of: self)
        return String(describing: className)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.title = key
        
        let label = UILabel()
        label.text = key
        label.sizeToFit()
        label.center = view.center
        label.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        view.addSubview(label)
    }
}
