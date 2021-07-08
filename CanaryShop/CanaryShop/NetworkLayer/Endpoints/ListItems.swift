//
//  ListItems.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

struct ListItems: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
    
    init() {
        let baseURL = "\(Constants.API.host)/\(endpointPath)"
        let urlComps = URLComponents(string: baseURL)
        path = urlComps?.url?.absoluteString ?? ""
    }
    
    
}
