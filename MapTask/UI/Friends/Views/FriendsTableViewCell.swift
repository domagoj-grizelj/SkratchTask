//
//  FriendTableViewCell.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import Foundation
import UIKit
import Kingfisher

class FriendsTableViewCell: UITableViewCell {

    // MARK: - Properties

    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupViews()
    }

}

// MARK: - Public Methods

extension FriendsTableViewCell {

    func setData(_ user: User) {
        avatarImageView.kf.setImage(with: URL(string: user.picture?.medium ?? ""))
        nameLabel.text = "\(user.name?.first ?? "") \(user.name?.last ?? "")"
        usernameLabel.text = user.login?.username
    }

}

// MARK: - View Setup

private extension FriendsTableViewCell {

    func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        setupAvatarImageView()
        setupNameLabel()
        setupUsernameLabel()
    }

    func setupAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 54/2
        avatarImageView.backgroundColor = .paleBlue
        avatarImageView.clipsToBounds = true
        avatarImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(16)
            $0.width.height.equalTo(54)
        }
    }

    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.custom(type: .standard, size: 17)
        nameLabel.textColor = .black
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.right.equalTo(-16)
            $0.height.equalTo(28)
            $0.left.equalTo(86)
        }
    }

    func setupUsernameLabel() {
        addSubview(usernameLabel)
        usernameLabel.textAlignment = .left
        usernameLabel.font = UIFont.custom(type: .standard, size: 15)
        usernameLabel.textColor = .skratchGray
        usernameLabel.snp.makeConstraints {
            $0.bottom.equalTo(-10)
            $0.right.equalTo(-16)
            $0.height.equalTo(28)
            $0.left.equalTo(86)
        }
    }

}
