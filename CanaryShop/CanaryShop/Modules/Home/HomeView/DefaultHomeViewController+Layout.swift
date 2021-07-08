//
//  DefaultHomeViewController+Layout.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

internal extension DefaultHomeViewController {
    
    func setUpLayoutView() {
        layoutTableViewComponent()
        layoutBuyButton()
    }
    
    private func layoutTableViewComponent() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
    
    private func layoutBuyButton() {
        view.addSubview(buyButton)
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16).isActive = true
    }
    
}
