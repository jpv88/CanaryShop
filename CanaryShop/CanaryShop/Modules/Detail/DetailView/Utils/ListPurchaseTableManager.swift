//
//  ListPurchaseTableManager.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

protocol PurchaseActions {
    func updateUI()
}

class ListPurchaseTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: [ListPurchaseModel]?
    var delegate: PurchaseActions?
    
    func set(input: [ListPurchaseModel]) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListPurchaseTableViewCell.getIdentifier(), for: indexPath) as? ListPurchaseTableViewCell else {
            return UITableViewCell()
        }
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        let source = dataSource[indexPath.row]
        cell.fill(itemName: source.itemName, quantity: source.quantity, price: source.price, priceWithDiscount: source.priceWithDiscount, discountDescription: source.discountDescription)
        return cell
    }
    
}

