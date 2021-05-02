//
//  PageContentView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import UIKit

class PageContentView: UIView {

    // MARK: - Properties

    let switchView = SwitchView()
    let friendsCountView = FriendsCountView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isContentEnabled = frame.contains(point) && friendsCountView.state != .count
        return switchView.frame.contains(point) || friendsCountView.frame.contains(point) || isContentEnabled
    }

}

// MARK: - Public Methods

extension PageContentView {

    func set(selectedSwitchButton: SwitchView.SelectedButton) {
        switchView.set(selectedButton: selectedSwitchButton)
    }

    func set(state: FriendsCountView.FriendsCountViewState, count: Int) {
        friendsCountView.set(state: state, count: count)
        backgroundColor = state == .confirmation ? .transparentBlack : .clear
    }

    func updateBottomConstraint(for height: CGFloat) {
        friendsCountView.snp.updateConstraints {
            if height == 60 {
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            } else if height > 200 {
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).offset(-height+safeAreaInsets.bottom - 24)
            } else {
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            }
        }
    }

}

// MARK: - Private Methods

private extension PageContentView {

    func setupViews() {
        setupSwitchView()
        setupFriendsCountView()
    }

    private func setupSwitchView() {
        addSubview(switchView)
        switchView.layer.shadowColor = UIColor.black.cgColor
        switchView.layer.shadowOpacity = 0.15
        switchView.layer.shadowRadius = 4
        switchView.layer.shadowOffset = CGSize(width: 0, height: 2)
        switchView.snp.makeConstraints {
            $0.left.equalTo(24)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            $0.width.equalTo(138)
            $0.height.equalTo(48)
        }
    }

    private func setupFriendsCountView() {
        addSubview(friendsCountView)
        friendsCountView.layer.shadowColor = UIColor.black.cgColor
        friendsCountView.layer.shadowOpacity = 0.15
        friendsCountView.layer.shadowRadius = 4
        friendsCountView.layer.shadowOffset = CGSize(width: 0, height: 2)
        friendsCountView.snp.makeConstraints {
            $0.right.equalTo(-24)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            $0.width.greaterThanOrEqualTo(48)
        }
    }

}
