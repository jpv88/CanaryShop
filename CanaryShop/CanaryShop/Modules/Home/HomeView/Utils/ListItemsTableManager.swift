//
//  ListItemsTableManager.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

protocol ListActions {
    func someItemPressed(id: String)
    func updateUI()
}

class ListItemsTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: ListItemsModel?
    var delegate: ListActions?
    
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
        guard let products = dataSource.products, let title = products[indexPath.row].name else { return UITableViewCell() }
        cell.fill(itemTitle: title)
        return cell
    }
    
}
