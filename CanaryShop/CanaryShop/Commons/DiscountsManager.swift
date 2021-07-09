//
//  DiscountsManager.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

enum DiscountType {
    case TwoForOne
    case ThreeOrMore
    case none
    
    func isApplicableDiscount(quantity: Int) -> Bool {
        switch self {
        case .TwoForOne:
            if quantity >= 2 { return true } else { return false }
        case .ThreeOrMore:
            if quantity >= 3 { return true } else { return false }
        case .none:
            return false
        }
    }
    
    func getDiscountPrice(quantity: Int, originalPrice: Double) -> Double {
        switch self {
        case .TwoForOne:
            let itemsPending = quantity % 2
            let canApplyDiscountInItems = quantity - itemsPending
            let itemsWithDiscount = (Double(canApplyDiscountInItems) * originalPrice) / 2
            let pendingItems = quantity - canApplyDiscountInItems
            let itemsWithoutDiscount = Double(pendingItems) * originalPrice
            return itemsWithDiscount + itemsWithoutDiscount
        case .ThreeOrMore:
            return Double(quantity) * (originalPrice - 1)
        case .none:
            return originalPrice * Double(quantity)
        }
    }
    
}

enum ProductType: String {
    case VOUCHER
    case TSHIRT
    case MUG
    case `default`
}

protocol Discountable {
    var discountType: DiscountType { get }
    func calculatePrice(quantity: Int, originalPrice: Double) -> Double
}

extension ProductType {
    var getDiscount: Discountable {
        switch self {
        case .VOUCHER:
            return VoucherProduct()
        case .TSHIRT:
            return TshirtProduct()
        case .MUG:
            return VoucherProduct()
        case .default:
            return VoucherProduct()
        }
    }
    
    var getDiscountDescription: String {
        switch self {
        case .VOUCHER:
            return "Buy two of the same product, get one free."
        case .TSHIRT:
            return "If you buy 3 or more items, the price per unit is reduced."
        case .MUG:
            return "None"
        case .default:
            return "None"
        }
    }
}

struct VoucherProduct: Discountable {

    var discountType: DiscountType = DiscountType.TwoForOne

    func calculatePrice(quantity: Int, originalPrice: Double) -> Double {
        if discountType.isApplicableDiscount(quantity: quantity) {
            return discountType.getDiscountPrice(quantity: quantity, originalPrice: originalPrice)
        }
        return Double(quantity) * originalPrice
    }

}

struct TshirtProduct: Discountable {

    var discountType: DiscountType = DiscountType.ThreeOrMore

    func calculatePrice(quantity: Int, originalPrice: Double) -> Double {
        if discountType.isApplicableDiscount(quantity: quantity) {
            return discountType.getDiscountPrice(quantity: quantity, originalPrice: originalPrice)
        }
        return Double(quantity) * originalPrice
    }

}

class DiscountsManager {
    
    func getPriceFor(product: ProductType, quantity: Int, originalPrice: Double) -> Double {
        return product.getDiscount.calculatePrice(quantity: quantity, originalPrice: originalPrice)
    }
    
}
