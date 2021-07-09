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

    func showDetailView(list: ListItemsModel, invoice: [Invoice]) {
        guard let detailViewController = resolver.resolve(DetailViewController.self, arguments: list, invoice) as? DefaultDetailViewController else { return }
        DispatchQueue.main.async { [weak self] in
            self?.viewController.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}
