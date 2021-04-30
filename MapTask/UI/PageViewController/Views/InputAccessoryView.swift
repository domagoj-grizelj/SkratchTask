//
//  InputAccessoryView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import UIKit

class InputAccessoryView: UIView {

    // MARK: - Properties

    let placeholderLabel = UILabel()
    let textField = UITextField()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InputAccessoryView {


}

// MARK: - View Setup

private extension InputAccessoryView {

    func setupViews() {
        isHidden = true
        backgroundColor = .white
        setupPlaceholderLabel()
        setupTextField()
    }

    func setupPlaceholderLabel() {
        addSubview(placeholderLabel)
        placeholderLabel.text = PageLocale.kInputPlaceholder.localized
        placeholderLabel.font = UIFont.custom(type: .standard, size: 20)
        placeholderLabel.textColor = .skratchGray
        placeholderLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(16)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
    }

    func setupTextField() {
        addSubview(textField)
        textField.backgroundColor = .white
        textField.textAlignment = .right
        textField.tintColor = .black
        textField.keyboardType = .numberPad
        textField.font = UIFont.custom(type: .standard, size: 24)
        textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(-16)
            $0.left.equalTo(placeholderLabel.snp.right)
        }
    }

}
