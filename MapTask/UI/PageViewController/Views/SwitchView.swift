//
//  SwitchView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import UIKit
import SnapKit

class SwitchView: UIView {

    // MARK: - Properties

    private let backgroundSelectionView = UIView()
    private let stackView = UIStackView()
    private let mapImageView = UIImageView()
    private let friendsImageView = UIImageView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - View Setup

private extension SwitchView {

    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 24
        setupBackgroundSelectionView()
        setupStackView()
        setupMapImageView()
        setupFriendsImageView()
    }

    func setupBackgroundSelectionView() {
        addSubview(backgroundSelectionView)
        backgroundSelectionView.backgroundColor = .paleBlue
        backgroundSelectionView.layer.cornerRadius = 17
        backgroundSelectionView.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(34)
            $0.left.equalTo(7)
            $0.centerY.equalToSuperview()
        }
    }

    func setupStackView() {
        addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints {
            $0.left.equalTo(7)
            $0.right.equalTo(-7)
            $0.height.equalTo(48)
            $0.center.equalToSuperview()
        }
    }

    func setupMapImageView() {
        stackView.addArrangedSubview(mapImageView)
        mapImageView.contentMode = .center
        mapImageView.image = Assets.kSwitchMapIcon.image
        mapImageView.image = mapImageView.image?.withRenderingMode(.alwaysTemplate)
        mapImageView.tintColor = .purple
        mapImageView.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(34)
        }
    }

    func setupFriendsImageView() {
        stackView.addArrangedSubview(friendsImageView)
        friendsImageView.contentMode = .center
        friendsImageView.image = Assets.kSwitchListIcon.image
        friendsImageView.image = friendsImageView.image?.withRenderingMode(.alwaysTemplate)
        friendsImageView.tintColor = .purple
        friendsImageView.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(34)
        }
    }

}
