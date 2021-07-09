//
//  HomePresenter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

protocol HomePresenter {
    func viewWillAppear()
    func buyButtonPressed(list: ListItemsModel, invoice: [Invoice])
}
