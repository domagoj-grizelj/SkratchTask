//
//  FriendDetailsTableViewCell.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendDetailsTableViewCell: UITableViewCell {

    private let containerView = UIView()
    private let friendDetailsSubtitleView = FriendDetailsSubtitleView()

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
        friendDetailsSubtitleView.iconImageView.image = icon
        friendDetailsSubtitleView.titleLabel.text = title
        friendDetailsSubtitleView.subtitleLabel.text = subtitle
    }

}

// MARK: - Private Methods

private extension FriendDetailsTableViewCell {

    func setupViews() {
        selectionStyle = .none
        setupContainerView()
        setupFriendDetailsSubtitleView()
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

    func setupFriendDetailsSubtitleView() {
        containerView.addSubview(friendDetailsSubtitleView)
        friendDetailsSubtitleView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
