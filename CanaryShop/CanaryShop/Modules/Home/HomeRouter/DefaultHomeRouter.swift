//
//  DefaultHomeRouter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

class DefaultHomeRouter: HomeRouter {
    
    var viewController: BaseViewController    
    private let resolver: ResolverInjection
    
    init(resolver: ResolverInjection, viewController: BaseViewController) {
        self.resolver = resolver
        self.viewController = viewController
    }

    func showDetailView(detailModel: String) {
        
    }
    
}
