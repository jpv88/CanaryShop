//
//  HomeViewController.swift
//  CanaryShop
//
//  Created by Jared Perez Vega on 8/7/21.
//

import UIKit

@objc protocol HomeViewController where Self: UIViewController {
    func showLoadedInfo(input: String)
    func showThisError(error: Error)
}
