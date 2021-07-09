//
//  DiscountsInteractorInjection.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

internal extension Injector {
    
    func registerDiscountsInteractorInjection() {
        injector.register(DiscountsInteractor.self) { _ in
            DiscountsInteractor()
        }
    }
    
}
