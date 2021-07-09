//
//  DiscountsInteractor.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

class DiscountsInteractor: InOutInteractor<DiscountsInteractor.Input, DiscountsInteractor.Output> {
    
    typealias Input = (list: ListItemsModel, invoice: [Invoice])
    typealias Output = PurchaseModel
    
    private let discountsManager: DiscountsManager
    
    init(discountsManager: DiscountsManager) {
        self.discountsManager = discountsManager
        super.init()
    }
    
    override func execute(input: Input) async throws -> Output {
        var totalValue: Double = 0
        var listPurchases: [ListPurchaseModel] = []
        
        input.invoice.forEach { invoice in
            let productType = getProductByCode(code: invoice.code)
            let quantity = invoice.quantity
            let originalPrice = getOriginalPriceFor(product: input.list, with: invoice.code)
            let newPriceWithDiscount = discountsManager.getPriceFor(product: productType, quantity: quantity, originalPrice: originalPrice)
            let description = productType.getDiscountDescription
            let itemName = getNameBy(code: invoice.code, in: input.list)
            
            let newPurchase = ListPurchaseModel(itemName: itemName, quantity: "\(quantity)", price: originalPrice.description, priceWithDiscount: newPriceWithDiscount.description, discountDescription: description)
            
            listPurchases.append(newPurchase)
            totalValue = totalValue + newPriceWithDiscount
        }
        
        let resultObject = PurchaseModel(
            totalValue: totalValue.description+"€",
            listItems: listPurchases
        )
        return resultObject
    }
    
    private func getNameBy(code: String, in list: ListItemsModel) -> String {
        if let products = list.products, let element = products.first(where: {$0.code == code}) {
            return element.name ?? ""
        }
        return ""
    }
    
    private func getProductByCode(code: String) -> ProductType {
        return ProductType(rawValue: code) ?? .default
    }
    
    private func getOriginalPriceFor(product: ListItemsModel, with code: String) -> Double {
        if let products = product.products, let element = products.first(where: {$0.code == code}) {
            return element.price ?? 0
        }
        return 0
    }

}
