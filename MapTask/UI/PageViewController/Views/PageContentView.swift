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

    private let switchView = SwitchView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private Methods

private extension PageContentView {

    func setupViews() {
        setupSwitchView()
    }

    private func setupSwitchView() {
        addSubview(switchView)
        switchView.snp.makeConstraints {
            $0.left.equalTo(24)
            $0.bottom.equalTo(snp.bottom).offset(safeAreaInsets.bottom)
            $0.width.equalTo(138)
            $0.height.equalTo(48)
        }
    }


}
