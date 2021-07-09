//
//  ListItemsTableManager.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

protocol ListActions {
    func updateInvoice(invoice: [Invoice])
    func updateUI()
}

class ListItemsTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: ListItemsModel?
    var delegate: ListActions?
    private var invoices: [Invoice] = []
    
    func set(input: ListItemsModel) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.products?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemsTableViewCell.getIdentifier(), for: indexPath) as? ListItemsTableViewCell else {
            return UITableViewCell()
        }
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        guard let products = dataSource.products else { return UITableViewCell() }
        let product = products[indexPath.row]
        guard let title = product.name, let code = product.code, let price = product.price else { return UITableViewCell() }
        cell.delegate = self
        cell.fill(itemTitle: title, code: code, price: price.description)
        return cell
    }
    
}

extension ListItemsTableManager: ListItemsTableViewCellProtocol {
    
    func selectedInvoice(code: String, quantity: Int) {
        if let index = invoices.firstIndex(where: {$0.code == code}) {
            if quantity == 0 {
                invoices.remove(at: index)
            } else {
                invoices[index].quantity = quantity
            }
        } else {
            let newInvoice = Invoice(code: code, quantity: quantity)
            invoices.append(newInvoice)
        }
        delegate?.updateInvoice(invoice: invoices)
    }
        
}
