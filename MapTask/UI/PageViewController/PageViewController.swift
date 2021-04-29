//
//  PageViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import UIKit

class PageViewController: UIPageViewController {

    // MARK: - Properties

    private let contentView = PageContentView()
    private(set) lazy var contentViewControllers: [UIViewController] = {
        let mapViewController = MapViewController()
        let friendsViewController = UINavigationController(rootViewController: FriendsViewController())
        return [mapViewController, friendsViewController]
    }()

    // MARK: - Dependencies

    private let usersService: UsersService

    // MARK: - Lifecycle

    init(usersService: UsersService = UsersService()) {
        self.usersService = usersService
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }

}

// MARK: - View Setup

private extension PageViewController {

    private func setupView() {
        setupContentView()
    }

    func setupContentView() {
        setViewControllers([contentViewControllers[0]], direction: .forward, animated: true, completion: nil)
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.switchView.mapButton.addTarget(self, action: #selector(didTapMapButton), for: .touchUpInside)
        contentView.switchView.listButton.addTarget(self, action: #selector(didTapListButton), for: .touchUpInside)
    }

}

// MARK: - Data

private extension PageViewController {

    func getData() {
    }

}

// MARK: - Actions

private extension PageViewController {

    @objc func didTapMapButton() {
        contentView.set(selectedSwitchButton: .map)
        setViewControllers([contentViewControllers[0]], direction: .reverse, animated: true, completion: nil)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapListButton() {
        contentView.set(selectedSwitchButton: .list)
        self.setViewControllers([self.contentViewControllers[1]], direction: .forward, animated: true, completion: nil)
//        view.bringSubviewToFront(contentView)
    }

}
