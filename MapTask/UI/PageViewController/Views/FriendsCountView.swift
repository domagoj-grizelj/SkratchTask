//
//  FriendsCountView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import UIKit

class FriendsCountView: UIView {

    // MARK: - Properties

    let countButton = UIButton()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Publc Methods

extension FriendsCountView {

    func set(state: FriendsCountViewState, count: Int) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            switch state {
            case .count:
                self.backgroundColor = .white
                self.countButton.setTitle(String(count), for: .normal)
                self.countButton.setImage(nil, for: .normal)

            case .confirmation:
                self.backgroundColor = .purple
                self.countButton.setTitle("", for: .normal)
                self.countButton.setImage(Assets.kFriendCountCheckmark.image, for: .normal)
            }
        }
    }

}

// MARK: - View Setup

private extension FriendsCountView {

    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 24
        setupCountButton()
    }

    func setupCountButton() {
        addSubview(countButton)
        countButton.contentMode = .center
        countButton.clipsToBounds = true
        countButton.adjustsImageWhenHighlighted = false
        countButton.setTitle("5", for: .normal)
        countButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        countButton.setTitleColor(.black, for: .normal)
        countButton.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.edges.equalToSuperview()
        }
    }

}

extension FriendsCountView {

    enum FriendsCountViewState {

        case count
        case confirmation

    }
}
