//
//  DefaultHomeViewController+BuildComponents.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

internal extension DefaultHomeViewController {
    
    func buildView() {
        title = Constant.title
        view.accessibilityIdentifier = Constant.accessibilityIdentifier
        buildTableViewComponent()
        buildBuyButton()
    }
    
    private func buildTableViewComponent() {
        let component = UITableView()
        component.backgroundColor = .clear
        component.bounces = false
        component.separatorStyle = .singleLine
        component.separatorColor = Colors.tertiary
        component.delegate = tableManager
        component.dataSource = tableManager
        component.register(UINib(nibName: ListItemsTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: ListItemsTableViewCell.getIdentifier())
        tableView = component
    }
    
    private func buildBuyButton() {
        let component = UIButton()
        component.backgroundColor = .clear
        component.layer.cornerRadius = 5
        component.layer.borderWidth = 1
        component.layer.borderColor = Colors.secondary.cgColor
        component.tintColor = Colors.secondary
        component.setTitle(Constant.buyButton, for: .normal)
        component.setTitleColor(Colors.secondary, for: .normal)
        component.setTitleColor(Colors.tertiary, for: .disabled)
        component.addTarget(self, action: #selector(self.buyButtonTapped), for: .touchUpInside)
        component.isEnabled = false
        buyButton = component
    }
    
}
