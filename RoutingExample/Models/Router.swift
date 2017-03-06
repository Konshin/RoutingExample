//
//  Router.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

enum RouterSegue {
    case push
    case present
}

protocol Router {
    var mainController: UIViewController { get }
}
