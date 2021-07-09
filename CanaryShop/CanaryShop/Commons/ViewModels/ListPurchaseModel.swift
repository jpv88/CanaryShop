//
//  ListPurchaseModel.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

@objc class PurchaseModel: NSObject {
    let totalValue: String
    let listItems: [ListPurchaseModel]
    
    init(totalValue: String, listItems: [ListPurchaseModel]) {
        self.totalValue = totalValue
        self.listItems = listItems
    }
}

struct ListPurchaseModel {
    
    let itemName, quantity, price, priceWithDiscount, discountDescription: String
    
//    init(itemName: String, quantity: String, price: String, priceWithDiscount: String, discountDescription: String) {
//        self.itemName = itemName
//        self.quantity = quantity
//        self.price = price
//        self.priceWithDiscount = priceWithDiscount
//        self.discountDescription = discountDescription
//    }
    
}
