//
//  ListPurchaseTableViewCell.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

class ListPurchaseTableViewCell: UITableViewCell {

    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemNameValueLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var quantityValueLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceValueLabel: UILabel!
    @IBOutlet var priceDiscountLabel: UILabel!
    @IBOutlet var priceDiscountValueLabel: UILabel!
    @IBOutlet var discountDescriptionLabel: UILabel!    
    @IBOutlet var discountDescriptionValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .none
        itemNameLabel.textColor = Colors.secondary
        itemNameValueLabel.textColor = Colors.secondary
        quantityLabel.textColor = Colors.secondary
        quantityValueLabel.textColor = Colors.secondary
        priceLabel.textColor = Colors.secondary
        priceValueLabel.textColor = Colors.secondary
        priceDiscountLabel.textColor = Colors.secondary
        priceDiscountValueLabel.textColor = Colors.secondary
        discountDescriptionLabel.textColor = Colors.secondary
        discountDescriptionValueLabel.textColor = Colors.secondary
    }
    
    func fill(itemName: String, quantity: String, price: String, priceWithDiscount: String, discountDescription: String) {
        itemNameValueLabel.text = itemName
        quantityValueLabel.text = quantity
        priceValueLabel.text = price
        priceDiscountValueLabel.text = priceWithDiscount
        discountDescriptionValueLabel.text = discountDescription
    }
    
}
