//
//  DefaultDetailPresenter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    
    private weak var view: DetailViewController?
    private let router: DetailRouter
    
    init(view: DetailViewController, router: DetailRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
    
}
