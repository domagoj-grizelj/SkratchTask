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

class MapUserView: MGLAnnotationView {

    // MARK: - Properties

    private let nameLabel = UILabel()
    private let avatarImageView = UIImageView()

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

    func set(_ user: User) {
        nameLabel.text = user.name?.first
        avatarImageView.kf.setImage(with: URL(string: user.picture?.large ?? ""))
    }

}

// MARK: - View Setup

private extension MapUserView {

    func setupViews() {
        backgroundColor = .green
        setupNameLabel()
        setupAvatarImageView()
        snp.makeConstraints {
            $0.width.height.equalTo(100)
        }
    }

    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.backgroundColor = .white
        nameLabel.textAlignment = .center
        nameLabel.layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
        nameLabel.layer.shadowRadius = 4
        nameLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        nameLabel.font = UIFont.custom(type: .standard, size: 12)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.height.equalTo(22)
        }
    }

    func setupAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.backgroundColor = .white
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
        avatarImageView.layer.shadowRadius = 4
        avatarImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        avatarImageView.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.center.equalToSuperview()
        }
    }

}
