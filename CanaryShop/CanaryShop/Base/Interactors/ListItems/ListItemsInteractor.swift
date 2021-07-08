//
//  ListItemsInteractor.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

class ListItemsInteractor: OutputInteractor<ListItemsInteractor.Output> {
    
    typealias Output = String
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute() async throws -> Output {
        return ""
    }
}
