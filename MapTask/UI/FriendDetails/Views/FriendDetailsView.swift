//
//  FriendDetailsView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendDetailsView: UIView {

    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Public Methods

extension FriendDetailsView {

    func set(icon: UIImage?, title: String?) {
        iconImageView.image = icon
        titleLabel.text = title
    }

}

// MARK: - Private Methods

private extension FriendDetailsView {

    func setupViews() {
        setupIconImageView()
        setupTitleLabel()
    }

    func setupIconImageView() {
        addSubview(iconImageView)
        iconImageView.contentMode = .center
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.left.equalTo(16)
        }
    }

    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.custom(type: .standard, size: 17)
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(14)
            $0.right.equalTo(-24)
            $0.left.equalTo(iconImageView.snp.right).offset(24)
        }
    }

}
