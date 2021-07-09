//
//  HomeRouter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

protocol HomeRouter: RouterBase {
    func showDetailView(list: ListItemsModel, invoice: [Invoice])
}
