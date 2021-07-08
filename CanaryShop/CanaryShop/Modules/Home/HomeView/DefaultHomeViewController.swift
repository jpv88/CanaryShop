//
//  DefaultHomeViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    var presenter: HomePresenter?
    
    internal enum Constant {
        static let title = "Canary Shop"
        static let accessibilityIdentifier = "HomeView"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
//        buildView()
//        buildTableViewComponent()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
//        layoutTableViewComponent()
    }
    
}

extension DefaultHomeViewController: HomeViewController {
    
    func showLoadedInfo(input: String) {
        
    }
    
    func showThisError(error: Error) {
        
    }
        
}
