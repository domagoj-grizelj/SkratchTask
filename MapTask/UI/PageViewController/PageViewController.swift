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

    var interactor: PageBusinessLogic?
    var router: PageRoutingLogic?

    private lazy var contentView = PageContentView()
    private let friendCountInputView = InputAccessoryView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
    private let dummyTextField = UITextField()
    private var mapViewController: MapViewController
    private var friendsNavigationViewController: UINavigationController
    
    private var friendsViewController: FriendsViewController? {
        return friendsNavigationViewController.children.first as? FriendsViewController
    }

    // MARK: - Lifecycle

    init(delegate: PageRouterDelegate?) {
        let interactor = PageInteractor()
        let presenter = PagePresenter()
        let router = PageRouter()
        mapViewController = MapViewController(delegate: router)
        friendsNavigationViewController = UINavigationController(rootViewController: FriendsViewController(delegate: router))
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
        setViewControllers([mapViewController], direction: .forward, animated: true, completion: nil)

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
        contentView.set(selectedSwitchButton: .map)
        setViewControllers([mapViewController], direction: .reverse, animated: true, completion: nil)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapListButton() {
        contentView.set(selectedSwitchButton: .list)
        setViewControllers([friendsNavigationViewController], direction: .forward, animated: true, completion: nil)
        view.bringSubviewToFront(contentView)
    }

    @objc func didTapCountButton() {
        let stringNumber = friendCountInputView.textField.text ?? "5"
        let count = Int(stringNumber) ?? 5

        switch contentView.friendsCountView.state {
        case .count:
            contentView.set(state: .confirmation, count: count)
            friendCountInputView.textField.becomeFirstResponder()
            friendCountInputView.isHidden = false

        case .confirmation:
            contentView.set(state: .count, count: count)
            loadData()
            friendCountInputView.textField.resignFirstResponder()
            friendCountInputView.isHidden = true
        }
    }

}
