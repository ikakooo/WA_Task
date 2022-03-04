//
//  UITableViewCell+Extension.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
