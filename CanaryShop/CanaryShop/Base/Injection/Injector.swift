//
//  Injector.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation
import Swinject

typealias ResolverInjection = Resolver
class Injector {
    
    static let shared = Injector()
    internal let injector = Container()
    
    private init() {}
    
    func register() {
        registerUtilities()
        registerInteractors()
        registerModules()
    }
    
    private func registerUtilities() {
        registerUtils()
    }
    
    private func registerInteractors() {
        registerListItemsInteractorInjector()
    }
    
    private func registerModules() {
        registerHomeModule()
    }
}
