//
//  DefaultDetailViewController+Layout.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

internal extension DefaultDetailViewController {
    
    func layoutView() {
        layoutConfirmButtonComponent()
        layoutTotalLabelComponent()
        layoutTotalLabelValueComponent()
        layoutTableViewComponent()
    }
    
    private func layoutConfirmButtonComponent() {
        view.addSubview(confirmButton)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        confirmButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
    private func layoutTotalLabelComponent() {
        view.addSubview(totalLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.heightAnchor.constraint(equalToConstant: Constant.labelsHeight).isActive = true
        totalLabel.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -Constant.marginSeparator).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.marginSeparator).isActive = true
    }
    
    private func layoutTotalLabelValueComponent() {
        view.addSubview(totalValueLabel)
        
        totalValueLabel.translatesAutoresizingMaskIntoConstraints = false
        totalValueLabel.centerYAnchor.constraint(equalTo: totalLabel.centerYAnchor).isActive = true
        totalValueLabel.heightAnchor.constraint(equalToConstant: Constant.labelsHeight).isActive = true
        totalValueLabel.leadingAnchor.constraint(equalTo: totalLabel.leadingAnchor, constant: Constant.marginSeparator).isActive = true
    }
    
    private func layoutTableViewComponent() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: -Constant.marginSeparator).isActive = true
    }
    
}
