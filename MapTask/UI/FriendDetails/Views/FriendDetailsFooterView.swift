//
//  FriendDetailsFooterView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import UIKit

class FriendDetailsFooterView: UIView {

    private let registrationDateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension FriendDetailsFooterView {

    func set(user: User) {
        let text = FriendDetailsLocale.kRegistrationLabel.localized + (DateTools.getFormattedDateAndTimeFrom(dateString: user.registered?.date) ?? "")
        registrationDateLabel.text = text
    }

}

// MARK: - Private Methods

private extension FriendDetailsFooterView {

    func setupViews() {
        setupRegistrationDateLabel()
    }

    func setupRegistrationDateLabel() {
        addSubview(registrationDateLabel)
        registrationDateLabel.textAlignment = .center
        registrationDateLabel.font = UIFont.custom(type: .standard, size: 12)
        registrationDateLabel.textColor = .skratchNavy
        registrationDateLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(40)
        }
    }

}
