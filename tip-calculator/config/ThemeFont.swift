//
//  ThemeFont.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-19.
//

import UIKit

struct ThemeFont {
    // AvenirNext
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }

    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }

    static func demibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
    }
}
