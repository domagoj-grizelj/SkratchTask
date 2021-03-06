//
//  FriendDetailsHeaderView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit
import Kingfisher

class FriendDetailsHeaderView: UIView {

    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension FriendDetailsHeaderView {

    func set(user: User) {
        nameLabel.text = "\(user.name?.first?.capitalizingFirstLetter() ?? "") \(user.name?.last?.capitalizingFirstLetter() ?? "")"
        usernameLabel.text = user.login?.username

        let imageUrl = URL(string: user.picture?.large ?? "")
        avatarImageView.kf.setImage(with: imageUrl, options: [.transition(ImageTransition.fade(0.3)), .forceTransition])

    }

}

// MARK: - Private Methods

private extension FriendDetailsHeaderView {

    func setupViews() {
        setupAvatarImageView()
        setupNameLabel()
        setupUsernameLabel()
    }

    func setupAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 72/2
        avatarImageView.backgroundColor = .paleBlue
        avatarImageView.clipsToBounds = true
        avatarImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(16)
            $0.width.height.equalTo(72)
        }
    }

    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.custom(type: .standard, size: 24)
        nameLabel.textColor = .black
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(16)
            $0.right.equalTo(-24)
            $0.height.equalTo(30)
            $0.left.equalTo(24)
        }
    }

    func setupUsernameLabel() {
        addSubview(usernameLabel)
        usernameLabel.textAlignment = .center
        usernameLabel.font = UIFont.custom(type: .standard, size: 15)
        usernameLabel.textColor = .skratchGray
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalTo(-16)
            $0.right.equalTo(-24)
            $0.height.equalTo(28)
            $0.left.equalTo(24)
        }
    }
}
