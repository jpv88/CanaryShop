//
//  DefaultDetailPresenter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    
    private weak var view: DetailViewController?
    private let router: DetailRouter
    private let itemsList: ListItemsModel
    private let invoice: [Invoice]
    private let discountsInteractor: DiscountsInteractor
    
    init(view: DetailViewController, router: DetailRouter, itemsList: ListItemsModel, invoice: [Invoice], discountsInteractor: DiscountsInteractor) {
        self.view = view
        self.router = router
        self.itemsList = itemsList
        self.invoice = invoice
        self.discountsInteractor = discountsInteractor
    }
    
    func viewDidLoad() {
        async {
            do {
                let items = try await discountsInteractor.execute(input: (itemsList, invoice))
                view?.showLoadedInfo(input: items)
            } catch  {
                view?.showThisError(error: error)
            }
        }
    }
    
    func confirmButtonTapped() {
        router.showPurchaseSuccess()
    }
    
}
