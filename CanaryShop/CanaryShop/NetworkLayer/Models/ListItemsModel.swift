//
//  ListItemsModel.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

// MARK: - ListItemsModel
@objc class ListItemsModel: NSObject, Codable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let code, name: String?
    let price: Double?
    var quantitySelected: Int? = 0
}
