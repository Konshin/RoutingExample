//
//  MainSearchVM.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import Foundation

class MainResumeVM {
    private let router: ResumeRouter
    private let resumeFacade: ResumeFacade
    
    init(router: ResumeRouter, resumeFacade: ResumeFacade) {
        self.router = router
        self.resumeFacade = resumeFacade
    }
}
