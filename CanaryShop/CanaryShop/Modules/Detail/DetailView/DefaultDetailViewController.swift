//
//  DefaultDetailViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
    
    var presenter: DetailPresenter?
    
    internal enum Constant {
        static let title = "Purchase Detail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildView()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutView()
    }
}
