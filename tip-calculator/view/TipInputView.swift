//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-18.
//

import UIKit

class TipInputView: UIView {
    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        backgroundColor = .cyan
    }
}
