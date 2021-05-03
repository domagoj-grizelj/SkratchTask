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
    let mapButton = UIButton()
    let listButton = UIButton()

    private var selectedButton: SelectedButton = .map

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

extension SwitchView {

    func set(selectedButton: SelectedButton) {
        guard selectedButton != self.selectedButton else { return }

        self.selectedButton = selectedButton

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.mapButton.tintColor = selectedButton == .map ? .purple : .paleBlue
            self.listButton.tintColor = selectedButton == .list ? .purple : .paleBlue
            self.backgroundSelectionView.snp.updateConstraints {
                $0.left.equalTo(selectedButton == .map ? 7 : 69)
            }
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }

}

// MARK: - View Setup

private extension SwitchView {

    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 24
        setupBackgroundSelectionView()
        setupStackView()
        setupMapButton()
        setupListButton()
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

    func setupMapButton() {
        stackView.addArrangedSubview(mapButton)
        mapButton.contentMode = .center
        mapButton.adjustsImageWhenHighlighted = false
        let image = Assets.kSwitchMapIcon.image?.withRenderingMode(.alwaysTemplate)
        mapButton.setImage(image, for: .normal)
        mapButton.tintColor = .purple
        mapButton.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(34)
        }
    }

    func setupListButton() {
        stackView.addArrangedSubview(listButton)
        listButton.contentMode = .center
        listButton.adjustsImageWhenHighlighted = false
        let image = Assets.kSwitchListIcon.image?.withRenderingMode(.alwaysTemplate)
        listButton.setImage(image, for: .normal)
        listButton.tintColor = .paleBlue
        listButton.snp.makeConstraints {
            $0.width.equalTo(62)
            $0.height.equalTo(34)
        }
    }

}

// MARK: - Selected Button

extension SwitchView {

    enum SelectedButton {

        case map
        case list

    }

}
