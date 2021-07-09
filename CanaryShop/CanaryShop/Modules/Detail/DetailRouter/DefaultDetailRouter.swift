//
//  DefaultDetailRouter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

class DefaultDetailRouter: DetailRouter {
    
    var viewController: BaseViewController
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection, viewController: BaseViewController) {
        self.resolver = resolver
        self.viewController = viewController
    }
    
    func showPurchaseSuccess() {
        
    }
    
}
