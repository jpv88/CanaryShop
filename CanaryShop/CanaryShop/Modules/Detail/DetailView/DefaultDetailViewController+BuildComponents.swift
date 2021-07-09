//
//  DefaultDetailViewController+BuildComponents.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

internal extension DefaultDetailViewController {
    
    func buildView() {
        title = Constant.title
        view.accessibilityIdentifier = Constant.accessibilityIdentifier
        buildConfirmButtonComponent()
        buildTotalLabelComponent()
        buildTotalLabelValueComponent()
        buildTableViewComponent()
    }
    
    private func buildConfirmButtonComponent() {
        let component = UIButton()
        component.backgroundColor = .clear
        component.layer.cornerRadius = 5
        component.layer.borderWidth = 1
        component.layer.borderColor = Colors.secondary.cgColor
        component.tintColor = Colors.secondary
        component.setTitle(Constant.confirmButton, for: .normal)
        component.setTitleColor(Colors.secondary, for: .normal)
        component.addTarget(self, action: #selector(self.confirmButtonTapped), for: .touchUpInside)
        confirmButton = component
    }
    
    private func buildTotalLabelComponent() {
        let component = UILabel()
        component.text = "Total:"
        component.textColor = Colors.yellow
        totalLabel = component
    }
    
    private func buildTotalLabelValueComponent() {
        let component = UILabel()
        component.text = ""
        component.textColor = Colors.yellow
        totalValueLabel = component
    }
    
    private func buildTableViewComponent() {
        let component = UITableView()
        component.backgroundColor = .clear
        component.bounces = false
        component.separatorStyle = .singleLine
        component.separatorColor = Colors.tertiary
        component.delegate = tableManager
        component.dataSource = tableManager
        component.register(UINib(nibName: ListPurchaseTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: ListPurchaseTableViewCell.getIdentifier())
        tableView = component
    }
    
}
