//
//  LogoView.swift
//  tip-calculator
//
//  Created by Rajitha Liyanage on 2023-10-18.
//

import UIKit

class LogoView: UIView {

    private let imageView: UIImageView = {
        let view = UIImageView(image: .init(imageLiteralResourceName: "icCalculatorBW"))
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Mr TIP", attributes: [.font: ThemeFont.demibold(ofSize: 16)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 25)], range: NSRange(location: 3, length: 3))
        label.attributedText = text
        return label
    }()

    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: "Calculator",
            font: ThemeFont.demibold(ofSize: 20),
            textAlignment: .left)
    }()

    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            topLabel,
            bottomLabel
        ])
        view.axis = .vertical
        view.spacing = -4
        view.alignment = .leading

        return view
    }()

    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            imageView,
            vStackView
        ])
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center

        return view
    }()

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        self.addSubview(hStackView)

        hStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
        }
    }
}
