//
//  HomeInjection.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

internal extension Injector {
    
    func registerHomeModule() {
        registerRouter()
        registerPresenter()
        registerViewController()
    }
        
    private func registerRouter() {
        injector.register(HomeRouter.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultHomeRouter(resolver: r, viewController: view)
        }
    }
    
    private func registerPresenter() {
        injector.register(HomePresenter.self) { (r: ResolverInjection, view: DefaultHomeViewController) in
            let homeView = view as HomeViewController
            let baseVC = view as BaseViewController
            guard let router = r.resolve(HomeRouter.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let listItemsInteractor = r.resolve(ListItemsInteractor.self) else {
                fatalError("Invalid args!")
            }
            let presenter = DefaultHomePresenter(
                view: homeView,
                router: router,
                listItemsInteractor: listItemsInteractor
            )
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(HomeViewController.self) { r in
            let viewController = DefaultHomeViewController()
            let tableManager = r.resolve(ListItemsTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            let presenter = r.resolve(HomePresenter.self, argument: viewController)
            viewController.presenter = presenter
            return viewController
        }
    }
    
}
