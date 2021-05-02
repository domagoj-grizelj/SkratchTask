//
//  MapUserView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import Foundation
import UIKit
import SnapKit
import Mapbox
import Kingfisher

class MapUserView: MGLAnnotationView {

    // MARK: - Properties

    private let labelContainer = UIView()
    private let nameLabel = UILabel()
    private let avatarContainer = UIView()
    private let avatarImageView = UIImageView()

    var didTapOnAvatarButton: ((User) -> Void)?
    var user: User?

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Public Methods

extension MapUserView {

    func set(_ user: User?) {
        self.user = user
        let imageUrl = URL(string: user?.picture?.large ?? "")
        nameLabel.text = user?.name?.first
        avatarImageView.kf.setImage(with: imageUrl, options: [.transition(ImageTransition.fade(0.3)), .forceTransition])
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1
        }
    }

}

// MARK: - View Setup

private extension MapUserView {

    func setupViews() {
        alpha = 0
        backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewTap))
        addGestureRecognizer(tap)
        setupLabelContainer()
        setupNameLabel()
        setupAvatarContainer()
        setupAvatarImageView()
    }

    func setupLabelContainer() {
        addSubview(labelContainer)
        labelContainer.backgroundColor = .white
        labelContainer.layer.cornerRadius = 11
        labelContainer.layer.shadowColor = UIColor.black.cgColor
        labelContainer.layer.shadowOpacity = 0.15
        labelContainer.layer.shadowRadius = 4
        labelContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        labelContainer.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.height.equalTo(22)
            $0.centerX.equalToSuperview()
        }
    }

    func setupNameLabel() {
        labelContainer.addSubview(nameLabel)
        nameLabel.layer.masksToBounds = true
        nameLabel.backgroundColor = .clear
        nameLabel.textAlignment = .center

        nameLabel.font = UIFont.custom(type: .standard, size: 12)
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(0)
            $0.left.equalTo(8)
            $0.right.equalTo(-8)
            $0.height.equalTo(22)
            $0.centerX.equalToSuperview()
        }
    }

    func setupAvatarContainer() {
        addSubview(avatarContainer)
        avatarContainer.backgroundColor = .white
        avatarContainer.layer.cornerRadius = 30
        avatarContainer.layer.shadowColor = UIColor.black.cgColor
        avatarContainer.layer.shadowOpacity = 0.15
        avatarContainer.layer.shadowRadius = 4
        avatarContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        avatarContainer.snp.makeConstraints {
            $0.top.equalTo(30)
            $0.width.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
    }

    func setupAvatarImageView() {
        avatarContainer.addSubview(avatarImageView)
        avatarImageView.layer.masksToBounds = true
        avatarImageView.backgroundColor = .white
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc private func onViewTap() {
        guard let user = user else { return }
        didTapOnAvatarButton?(user)
    }

}
