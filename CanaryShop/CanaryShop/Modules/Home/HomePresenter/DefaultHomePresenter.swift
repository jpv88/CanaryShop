//
//  DefaultHomePresenter.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import Foundation

class DefaultHomePresenter: HomePresenter {
    
    private weak var view: HomeViewController?
    private let router: HomeRouter
    
    init(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
    }
    
    func onViewDidLoad() {
        // api call
    }
    
    func buyButtonPressed(element: String) {
        // send to detail screen
    }

}
