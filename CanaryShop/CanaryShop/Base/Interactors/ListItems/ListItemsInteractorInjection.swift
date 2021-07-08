//
//  ListItemsInteractorInjection.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

internal extension Injector {
    
    func registerListItemsInteractorInjector() {
        injector.register(ListItemsInteractor.self) { r in
            ListItemsInteractor(webService: r.resolve(WebService.self) ?? WebService())
        }
    }
    
}
