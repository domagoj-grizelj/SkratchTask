//
//  FriendDetailsSubtitleView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendDetailsSubtitleView: FriendDetailsView {

    let subtitleLabel = UILabel()

    override func setupViews() {
        super.setupViews()

        setupSubtitleLabel()
    }

    func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.font = UIFont.custom(type: .standard, size: 12)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = .skratchGray
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(37)
            $0.right.equalTo(-24)
            $0.left.equalTo(iconImageView.snp.right).offset(24)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}
