//
//  DefaultDetailViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
    
    var presenter: DetailPresenter?
    var tableManager: ListPurchaseTableManager?
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
        presenter?.confirmButtonTapped()
    }
}

extension DefaultDetailViewController: DetailViewController {
    
    func showLoadedInfo(input: [ListPurchaseModel]) {
        tableManager?.set(input: input)
    }
        
}

extension DefaultDetailViewController: PurchaseActions {
    
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
        
}
