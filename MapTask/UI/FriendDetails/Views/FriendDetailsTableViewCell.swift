//
//  FriendDetailsTableViewCell.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendDetailsTableViewCell: UITableViewCell {

    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Public Methods

extension FriendDetailsTableViewCell {

    func set(icon: UIImage?, title: String?, subtitle: String?) {
        iconImageView.image = icon
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

}

// MARK: - Private Methods

private extension FriendDetailsTableViewCell {

    func setupViews() {
        selectionStyle = .none
        setupContainerView()
        setupIconImageView()
        setupTitleLabel()
        setupSubtitleLabel()
    }

    func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .skratchUltralight
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.top.equalTo(4)
            $0.bottom.equalTo(-4)
        }
    }

    func setupIconImageView() {
        containerView.addSubview(iconImageView)
        iconImageView.contentMode = .center
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.left.equalTo(16)
        }
    }

    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.font = UIFont.custom(type: .standard, size: 17)
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(14)
            $0.right.equalTo(-24)
            $0.left.equalTo(iconImageView.snp.right).offset(24)
        }
    }

    func setupSubtitleLabel() {
        containerView.addSubview(subtitleLabel)
        subtitleLabel.font = UIFont.custom(type: .standard, size: 14)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = .skratchGray
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.right.equalTo(-24)
            $0.left.equalTo(iconImageView.snp.right).offset(24)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }

}
