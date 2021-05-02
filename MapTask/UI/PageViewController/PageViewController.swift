//
//  PageViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import UIKit

protocol PageDisplayLogic: AnyObject {

    func displayUsers(_ users: [User])

}

class PageViewController: UIPageViewController {

    // MARK: - Properties

    var interactor: (PageBusinessLogic & PageDataStore)?
    var router: (PageRoutingLogic & PageDataPassing)?

    private lazy var contentView = PageContentView()
    private let friendCountInputView = InputAccessoryView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
    private let dummyTextField = UITextField()

    // MARK: - Lifecycle

    init(delegate: PageRouterDelegate?) {
        let interactor = PageInteractor()
        let presenter = PagePresenter()
        let router = PageRouter()
        router.dataStore = interactor
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.delegate = delegate
        self.interactor = interactor
        self.router = router
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        router?.presentContainerViewControllers()
        setupView()
        setupObservers()
        loadData()
    }

    override var inputAccessoryView: UIView? {
        return friendCountInputView
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

}

// MARK: - Setup

private extension PageViewController {

    private func setupView() {
        setupContentView()
    }

    func setupContentView() {
        router?.switchToMapViewController()

        view.addSubview(contentView)
        contentView.switchView.mapButton.addTarget(self, action: #selector(didTapMapButton), for: .touchUpInside)
        contentView.switchView.listButton.addTarget(self, action: #selector(didTapListButton), for: .touchUpInside)
        contentView.friendsCountView.countButton.addTarget(self, action: #selector(didTapCountButton), for: .touchUpInside)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setupObservers() {
        registerForKeyboardWillShowNotification { (notif, size) in
            self.contentView.updateBottomConstraint(for: size.height)
            self.contentView.animateAlongsideKeyboard(notif: notif)
        }

        registerForKeyboardWillHideNotification { (notif) in
            self.contentView.updateBottomConstraint(for: 0)
            self.contentView.animateAlongsideKeyboard(notif: notif)
        }
    }

}

// MARK: - Display Logic

extension PageViewController: PageDisplayLogic {

    func displayUsers(_ users: [User]) {
        router?.passDataToFriends()
    }

}

// MARK: - Data

private extension PageViewController {

    func loadData() {
        interactor?.getUsers(numberOfUser: contentView.friendsCountView.numberOfUsers)
    }

}

// MARK: - Actions

private extension PageViewController {

    @objc func didTapMapButton() {
        router?.switchToMapViewController()
        contentView.set(selectedSwitchButton: .map)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapListButton() {
        router?.switchToFriendsViewController()
        contentView.set(selectedSwitchButton: .list)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapCountButton() {
        let stringNumber = friendCountInputView.textField.text ?? "5"
        let count = Int(stringNumber) ?? contentView.friendsCountView.numberOfUsers

        switch contentView.friendsCountView.state {
        case .count:
            contentView.set(state: .confirmation, count: count)
            friendCountInputView.textField.becomeFirstResponder()
            friendCountInputView.isHidden = false

        case .confirmation:
            friendCountInputView.textField.resignFirstResponder()
            friendCountInputView.isHidden = true
            contentView.set(state: .count, count: count)

            guard count != contentView.friendsCountView.numberOfUsers else { return }
            loadData()
        }
    }

}
