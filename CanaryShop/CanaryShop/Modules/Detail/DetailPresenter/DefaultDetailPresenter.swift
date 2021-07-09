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
        view?.showLoadedInfo(input: [
            ListPurchaseModel(itemName: "Coca", quantity: "2", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % "),
            ListPurchaseModel(itemName: "Coca", quantity: "2", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % "),
            ListPurchaseModel(itemName: "Coca", quantity: "2", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % "),
            ListPurchaseModel(itemName: "Coca", quantity: "2", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % "),
            ListPurchaseModel(itemName: "Coca", quantity: "2", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % "),
            ListPurchaseModel(itemName: "Coca2", quantity: "1", price: "10", priceWithDiscount: "5", discountDescription: "50 % 50 % 50 % 50 % 50 % 50 % 50 % 50 % ")
        ])
    }
    
    func confirmButtonTapped() {
        router.showPurchaseSuccess()
    }
    
}
