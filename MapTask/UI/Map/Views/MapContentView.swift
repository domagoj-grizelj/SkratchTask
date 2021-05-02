//
//  MapContentView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import UIKit
import Mapbox

class MapContentView: UIView {

    let mapView = MGLMapView(frame: .zero, styleURL: URL(string: "mapbox://styles/mapbox/streets-v11"))

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
        addSubview(mapView)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 2, animated: false)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
