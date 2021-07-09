//
//  DefaultHomePresenter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

class DefaultHomePresenter: HomePresenter {
    
    private weak var view: HomeViewController?
    private let router: HomeRouter
    private let listItemsInteractor: ListItemsInteractor
    
    init(view: HomeViewController, router: HomeRouter, listItemsInteractor: ListItemsInteractor) {
        self.view = view
        self.router = router
        self.listItemsInteractor = listItemsInteractor
    }
    
    func viewWillAppear() {
        getItems()
    }
    
    func buyButtonPressed(list: ListItemsModel, invoice: [Invoice]) {
        router.showDetailView(list: list, invoice: invoice)
    }

    private func getItems() {
        async {
            do {
                await view?.showLoader()
                let items = try await listItemsInteractor.execute()
                view?.showLoadedInfo(input: items)
                await view?.hideLoader()
            } catch  {
                view?.showThisError(error: error)
            }
        }
    }
    
}
