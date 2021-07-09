//
//  DetailViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 9/7/21.
//

import UIKit

@objc protocol DetailViewController where Self: UIViewController {
    func showLoadedInfo(input: String)    
}
