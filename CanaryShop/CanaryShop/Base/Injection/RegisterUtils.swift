//
//  RegisterUtils.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

internal extension Injector {
    
    func registerUtils() {
        registerWebService()
        registerListItemsTableManager()
    }
    
    private func registerWebService() {
        injector.register(WebService.self) { _ in
            WebService()
        }
    }
    
    private func registerListItemsTableManager() {
        injector.register(ListItemsTableManager.self) { _ in
            ListItemsTableManager()
        }
    }
    
}
