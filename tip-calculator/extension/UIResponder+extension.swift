//
//  UIResponder+extension.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-11-06.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
