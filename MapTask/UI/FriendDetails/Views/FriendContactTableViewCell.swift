//
//  FriendContactTableViewCell.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendContactTableViewCell: UITableViewCell {

    private let containerView = UIView()
    let phoneView = FriendDetailsView()
    let emailView = FriendDetailsView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private Methods

private extension FriendContactTableViewCell {

    func setupViews() {
        selectionStyle = .none
        setupContainerView()
        setupPhoneView()
        setupEmailView()
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

    func setupPhoneView() {
        containerView.addSubview(phoneView)
        phoneView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.left.equalToSuperview()
        }
    }

    func setupEmailView() {
        containerView.addSubview(emailView)
        emailView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(phoneView.snp.bottom).offset(8)
            $0.left.equalToSuperview()
            $0.bottom.equalTo(-20)
        }
    }

}
