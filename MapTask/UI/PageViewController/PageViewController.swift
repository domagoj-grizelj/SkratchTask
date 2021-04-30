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
    private let customInput = InputAccessoryView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
    private let textField = UITextField()
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
        reloadInputViews()
    }

    override var inputAccessoryView: UIView? {
        return customInput
    }

    override var canBecomeFirstResponder: Bool {
        return true
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
        contentView.friendsCountView.countButton.addTarget(self, action: #selector(didTapCountButton), for: .touchUpInside)
//        contentView.addSubview(customInput)
//        customInput.keyboardType = .numberPad
//        customInput.snp.makeConstraints {
//            $0.bottom.left.equalTo(-16)
//            $0.right.equalTo(-16)
//            $0.height.equalTo(30)
//        }
        customInput.backgroundColor = .red
        customInput.snp.makeConstraints {
            $0.height.width.equalTo(80)
        }
        view.bringSubviewToFront(customInput)
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
        setViewControllers([self.contentViewControllers[1]], direction: .forward, animated: true, completion: nil)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapCountButton() {
        contentView.set(state: .confirmation, count: 5)
        customInput.textField.becomeFirstResponder()
        customInput.isHidden = false
        reloadInputViews()
    }

}

extension PageViewController: UITextFieldDelegate {


}
