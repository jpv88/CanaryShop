//
//  DefaultDetailViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
    
    var presenter: DetailPresenter?
    internal var confirmButton: UIButton!
    internal var totalLabel: UILabel!
    internal var totalValueLabel: UILabel!
    internal var tableView: UITableView!
    
    internal enum Constant {
        static let title = "Purchase Detail"
        static let accessibilityIdentifier = "DetailView"
        static let confirmButton = "Confirm"
        static let marginSeparator: CGFloat = 16
        static let labelsHeight: CGFloat = 21
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
    
    @objc func confirmButtonTapped(sender : UIButton) {
        
    }
}

extension DefaultDetailViewController: DetailViewController {
    
    func showLoadedInfo(input: String) {
        
    }
        
}
