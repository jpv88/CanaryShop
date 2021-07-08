//
//  UITableViewCell+Identifier.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

extension UITableViewCell {
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}
