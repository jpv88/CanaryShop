//
//  DefaultHomeViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    var presenter: HomePresenter?
    internal var tableView: UITableView!
    var tableManager: ListItemsTableManager?
    internal var buyButton: UIButton!
    
    internal enum Constant {
        static let title = "Canary Shop"
        static let accessibilityIdentifier = "HomeView"
        static let buyButton = "Comprar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildView()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        setUpLayoutView()
    }
    
    @objc func buyButtonTapped(sender : UIButton) {
        
    }
    
}

extension DefaultHomeViewController: HomeViewController {
    
    func showLoadedInfo(input: ListItemsModel) {
        tableManager?.set(input: input)
    }
    
    func showThisError(error: Error) {
        showError(error: error)
    }
        
}

extension DefaultHomeViewController: ListActions {
    
    func someItemPressed(id: String) {
        
    }
    
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
