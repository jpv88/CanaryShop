//
//  ListItemsInteractor.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

class ListItemsInteractor: OutputInteractor<ListItemsInteractor.Output> {
    
    typealias Output = ListItemsModel
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute() async throws -> Output {
        
        do {
            let items = try await webService.load(type: ListItemsModel.self, endpoint: .List)
            return items
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }

    }
}
