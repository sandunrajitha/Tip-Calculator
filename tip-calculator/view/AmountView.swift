//
//  AmountView.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-23.
//

import UIKit

class AmountView: UIView {

    private var title: String
    private var textAlignment: NSTextAlignment

    private lazy var titleLabel: UILabel = {
        LabelFactory.build(
            text: title,
            font: ThemeFont.regular(ofSize: 18),
            textColor: ThemeColor.text,
            textAlignment: textAlignment
        )
    }()

    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 24)
            ])
        text.addAttributes([
            .font: ThemeFont.bold(ofSize: 18)
        ], range: NSRange(location: 0, length: 1))
        label.textAlignment = textAlignment
        label.textColor = ThemeColor.primary
        label.attributedText = text
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            amountLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = -4

        return stackView
    }()

    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
