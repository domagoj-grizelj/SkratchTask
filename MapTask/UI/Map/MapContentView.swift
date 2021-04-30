//
//  MapContentView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import UIKit

class MapContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension MapContentView {
    func setupViews() {
        // setup background, shadows, etc
        // call other views setup
    }
}
