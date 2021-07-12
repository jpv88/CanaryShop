//
//  ListItemsInteractorMock.swift
//  CanaryShopTests
//
//  Created by Jared Perez Vega on 12/7/21.
//

import XCTest
@testable import CanaryShop

class ListItemsInteractorMock: ListItemsInteractor {
    
    override func execute() async throws -> ListItemsInteractor.Output {
        guard let file = readLocalFile(forName: "ListItemsModelJSON") else { fatalError("No File") }
        guard let model = parse(jsonData: file) else { fatalError("No Model") }
        return model
    }    
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    private func parse(jsonData: Data) -> ListItemsModel? {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .deferredToDate
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ListItemsModel.self,
                                                       from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
    
}
