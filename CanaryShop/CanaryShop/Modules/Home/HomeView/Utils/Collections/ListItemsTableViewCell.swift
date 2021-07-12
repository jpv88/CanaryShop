//
//  ListItemsTableViewCell.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

protocol ListItemsTableViewCellProtocol {
    func selectedInvoice(code: String, quantity: Int)
}

class ListItemsTableViewCell: UITableViewCell {
    
    var delegate: ListItemsTableViewCellProtocol?
    
    private enum OperatorType {
        case plus
        case minus
    }

    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var minusButton: UIButton!
    @IBOutlet private var quantityLabel: UILabel!
    @IBOutlet private var quantityTitleLabel: UILabel!
    @IBOutlet private var itemNameLabel: UILabel!
    @IBOutlet private var itemTitleLabel: UILabel!
    @IBOutlet private var priceTitleLabel: UILabel!
    @IBOutlet private var priceValueLabel: UILabel!
    
    private var code: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .none
        plusButton.accessibilityIdentifier = "PlusButtonBuy"
        itemTitleLabel.textColor = Colors.secondary
        quantityTitleLabel.textColor = Colors.secondary
        itemNameLabel.textColor = Colors.secondary
        quantityLabel.textColor = Colors.secondary
        quantityLabel.text = "0"
        priceTitleLabel.textColor = Colors.secondary
        priceValueLabel.textColor = Colors.secondary
        configButton(button: plusButton)
        configButton(button: minusButton)
    }
    
    private func configButton(button: UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.secondary.cgColor
        button.tintColor = Colors.secondary
    }
    
    func fill(itemTitle: String, code: String, price: String, quantity: String = "0") {
        itemNameLabel.text = itemTitle
        priceValueLabel.text = price
        quantityLabel.text = quantity
        self.code = code
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        updateQuantity(operation: .minus)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        updateQuantity(operation: .plus)
    }
    
    private func updateQuantity(operation: OperatorType) {
        guard let hasQuantityValue = quantityLabel.text else { return }
        guard let currentQuantity = Int(hasQuantityValue) else { return }
        switch operation {
        case .plus:
            if currentQuantity == 10 { return }
            increaseQuantity(currentQuantity: currentQuantity)
        case .minus:
            if currentQuantity == 0 { return }
            decreaseQuantity(currentQuantity: currentQuantity)
        }
    }
    
    private func increaseQuantity(currentQuantity: Int) {
        let newQuantity = currentQuantity + 1
        delegate?.selectedInvoice(code: code, quantity: newQuantity)
        quantityLabel.text = "\(newQuantity)"
    }
    
    private func decreaseQuantity(currentQuantity: Int) {
        let newQuantity = currentQuantity - 1
        delegate?.selectedInvoice(code: code, quantity: newQuantity)
        quantityLabel.text = "\(newQuantity)"
    }
    
}
