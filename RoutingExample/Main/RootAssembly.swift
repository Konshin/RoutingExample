//
//  RootAssembly.swift
//  RoutingExample
//
//  Created by Алексей Коньшин on 03.03.17.
//  Copyright © 2017 SuperJob. All rights reserved.
//

import UIKit

typealias ProfileFacade = NSObject
typealias LocationFacade = NSObject
typealias ResumeFacade = NSObject
typealias AnyTempFacade = NSObject

class RootAssembly {
    fileprivate let profileFacade = ProfileFacade()
    fileprivate let locationFacade = LocationFacade()
    fileprivate let resumeFacade = ResumeFacade()
    
    var anyFacade: AnyTempFacade {
        return AnyTempFacade()
    }
    
    //MARK: - controllers
    
    func mainResumeController(router: ResumeRouter) -> UIViewController {
        let vm = MainResumeVM(router: router, resumeFacade: resumeFacade)
        let vc = MainResumeController(vm: vm)
        return vc
    }
    
    func mainSearchController(router: SearchRouter) -> UIViewController {
        let vm = MainSearchVM(router: router, profileFacade: profileFacade)
        let vc = MainSearchController(vm: vm)
        return vc
    }
    
    func suggestsController(delegate: SearchSuggestsDelegate) -> UIViewController {
        let vm = SearchSuggestsVM(
            locationFacade: locationFacade,
            delegate: delegate
        )
        let vc = SearchSuggestsController(vm: vm)
        return vc
    }
    
    func searchResultsController(filter: Filter, router: SearchRouter) -> UIViewController {
        let vm = SearchResultsVM(router: router, filter: filter)
        let vc = SearchResultsController(vm: vm)
        return vc
    }
    
    func filtersController(filter: Filter, delegate: SearchFilterDelegate) -> UIViewController {
        let vm = SearchFilterVM(
            filter: filter,
            locationFacade: locationFacade,
            anyFacade: anyFacade,
            delegate: delegate
        )
        let vc = SearchFilterController(vm: vm)
        return vc
    }
}
