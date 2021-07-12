//
//  DiscountsInteractorTest.swift
//  CanaryShopTests
//
//  Created by Jared Perez Vega on 12/7/21.
//

import XCTest
@testable import CanaryShop

class DiscountsInteractorTest: XCTestCase {
    
    var discountInteractor: DiscountsInteractorMock!
    var listItemsModel: ListItemsModel!
    
    private let listItemInteractor = ListItemsInteractorMock(webService: WebService())

    override func setUpWithError() throws {
      try super.setUpWithError()
        let exp = expectation(description: "\(#function)\(#line)")
        async {
            let model = try await listItemInteractor.execute()
            self.listItemsModel = model
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        discountInteractor = buildInteractor()
    }

    override func tearDownWithError() throws {
        discountInteractor = nil
      try super.tearDownWithError()
    }
    
    func testShouldReturn_32_50_When_Buy_VOUCHER_TSHIRT_MUG() async {
        do {
            let result = try await discountInteractor.execute(input: (self.listItemsModel, Invoice.stub_VOUCHER_TSHIRT_MUG()))            
            XCTAssertEqual(result.totalValue, "32.5€")
        } catch {}
    }
    
    func testShouldReturn_25_When_Buy_VOUCHER_TSHIRT_VOUCHER() async {
        do {
            let result = try await discountInteractor.execute(input: (self.listItemsModel, Invoice.stub_VOUCHER_TSHIRT_VOUCHER()))
            XCTAssertEqual(result.totalValue, "25.0€")
        } catch {}
    }
    
    func testShouldReturn_81_When_Buy_TSHIRT_TSHIRT_TSHIRT_VOUCHER_TSHIRT() async {
        do {
            let result = try await discountInteractor.execute(input: (self.listItemsModel, Invoice.stub_TSHIRT_TSHIRT_TSHIRT_VOUCHER_TSHIRT()))
            XCTAssertEqual(result.totalValue, "81.0€")
        } catch {}
    }
    
    func testShouldReturn_74_50_When_Buy_VOUCHER_TSHIRT_VOUCHER_VOUCHER_MUG_TSHIRT_TSHIRT() async {
        do {
            let result = try await discountInteractor.execute(input: (self.listItemsModel, Invoice.stub_VOUCHER_TSHIRT_VOUCHER_VOUCHER_MUG_TSHIRT_TSHIRT()))
            XCTAssertEqual(result.totalValue, "74.5€")
        } catch {}
    }
    
}

extension DiscountsInteractorTest {
    
    private func buildInteractor() -> DiscountsInteractorMock {
        return DiscountsInteractorMock(discountsManager: DiscountsManagerMock())
    }

}
