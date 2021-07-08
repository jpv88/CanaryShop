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
    }
    
    func buildTableViewComponent() {
        let component = UITableView()
        component.backgroundColor = .clear
        component.bounces = false
        component.separatorStyle = .none
        component.delegate = tableManager
        component.dataSource = tableManager
        component.register(UINib(nibName: ListItemsTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: ListItemsTableViewCell.getIdentifier())
        tableView = component
    }
    
}
