//
//  ViewController.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-17.
//

import UIKit
import SnapKit

class CalculatorVC: UIViewController {

    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()

    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    private func layout() {
        view.backgroundColor = ThemeColor.bg
        view.addSubview(vStackView)

        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
        }

        logoView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        resultView.snp.makeConstraints { make in
            make.height.equalTo(225)
        }

        billInputView.snp.makeConstraints { make in
            make.height.equalTo(55)
        }

        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(125)
        }

        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
    }

}

