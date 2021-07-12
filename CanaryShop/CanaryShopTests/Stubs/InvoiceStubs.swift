//
//  InvoiceStubs.swift
//  CanaryShopTests
//
//  Created by Jared Perez Vega on 12/7/21.
//

import XCTest
@testable import CanaryShop

extension Invoice {
    
    static func stub_VOUCHER_TSHIRT_MUG() -> [Invoice] {
        return [
            Invoice(code: "VOUCHER", quantity: 1),
            Invoice(code: "TSHIRT", quantity: 1),
            Invoice(code: "MUG", quantity: 1)
        ]
    }
    
    static func stub_VOUCHER_TSHIRT_VOUCHER() -> [Invoice] {
        return [
            Invoice(code: "VOUCHER", quantity: 2),
            Invoice(code: "TSHIRT", quantity: 1)
        ]
    }
    
    static func stub_TSHIRT_TSHIRT_TSHIRT_VOUCHER_TSHIRT() -> [Invoice] {
        return [
            Invoice(code: "VOUCHER", quantity: 1),
            Invoice(code: "TSHIRT", quantity: 4)
        ]
    }    
    
    static func stub_VOUCHER_TSHIRT_VOUCHER_VOUCHER_MUG_TSHIRT_TSHIRT() -> [Invoice] {
        return [
            Invoice(code: "VOUCHER", quantity: 3),
            Invoice(code: "TSHIRT", quantity: 3),
            Invoice(code: "MUG", quantity: 1)
        ]
    }
    
}
