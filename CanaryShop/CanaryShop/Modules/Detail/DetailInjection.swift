//
//  DetailInjection.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

internal extension Injector {
    
    func registerDetailModule() {
        registerRouter()
        registerPresenter()
        registerViewController()
    }
        
    private func registerRouter() {
        injector.register(DetailRouter.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultDetailRouter(resolver: r, viewController: view)
        }
    }
    
    private func registerPresenter() {
        injector.register(DetailPresenter.self) { (r: ResolverInjection, items: ListItemsModel, invoice: [Invoice], view: DefaultDetailViewController) in
            let detailView = view as DetailViewController
            let baseVC = view as BaseViewController
            guard let router = r.resolve(DetailRouter.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let discountsInteractor = r.resolve(DiscountsInteractor.self) else {
                fatalError("Invalid args!")
            }
            let presenter = DefaultDetailPresenter(
                view: detailView,
                router: router,
                itemsList: items,
                invoice: invoice,
                discountsInteractor: discountsInteractor
            )
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(DetailViewController.self) { (r: ResolverInjection, items: ListItemsModel, invoice: [Invoice]) in
            let viewController = DefaultDetailViewController()
            let tableManager = r.resolve(ListPurchaseTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            let presenter = r.resolve(DetailPresenter.self, arguments: items, invoice, viewController)
            viewController.presenter = presenter
            return viewController
        }
    }
}
