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

    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 24
        setupStackView()
    }

    private func setupStackView() {
        addSubview(stackView)
        stackView.addSubview(mapImageView)
        stackView.addSubview(friendsImageView)
        stackView.snp.makeConstraints {
            $0.width.equalTo(138)
            $0.height.equalTo(48)
            $0.center.equalTo(self.snp.center)
        }
    }

    private func setupMapImageView() {
        mapImageView.backgroundColor = .green
    }

}
