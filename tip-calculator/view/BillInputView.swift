//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-18.
//

import UIKit

class BillInputView: UIView {

    private let headerView: HeaderView = {
        return HeaderView()
    }()

    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.addCornerRadius(radius: 8.0)
        view.backgroundColor = .white
        return view
    }()

    private let currencyDenominationLabel: UILabel = {
        let label = LabelFactory.build(
            text: "$",
            font: ThemeFont.bold(ofSize: 24))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = ThemeFont.demibold(ofSize: 28)
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.tintColor = ThemeColor.text
        textField.textColor = ThemeColor.text
        // Add toolbar
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(doneButtonTapped)
        )
        toolbar.items = [
        UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil),
        doneButton
        ]
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolbar
        return textField
    }()

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [headerView, textFieldContainerView].forEach(addSubview(_:))

        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
            make.width.equalTo(68)
        }

        textFieldContainerView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }

        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)

        currencyDenominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }

        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }

    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}

class HeaderView: UIView {
    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        backgroundColor = .red
    }
}
