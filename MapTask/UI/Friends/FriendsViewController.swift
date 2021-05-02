//
//  FriendsViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import UIKit

protocol FriendsDisplayLogic: AnyObject {

    func displayUsers()

}

class FriendsViewController: UIViewController {

    // MARK: - Properties

    var interactor: FriendsBusinessLogic?
    var router: FriendsRoutingLogic?
    private lazy var contentView = FriendsContentView()
    var users: [User]? {
        didSet {
            contentView.tableView.reloadData()
        }
    }

    // MARK: - Lifecycle

    init(delegate: FriendsRouterDelegate?) {
        super.init(nibName: nil, bundle: nil)
        let interactor = FriendsInteractor()
        let presenter = FriendsPresenter()
        let router = FriendsRouter()
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

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    func setupViews() {
        setupContentView()
        setupNavigation()
    }

    func setupContentView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }

    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        extendedLayoutIncludesOpaqueBars = true;
        setSolidNavigationStyle(withBackgroundColor: .white, tintColor: .black, shadowColor: .white)
        navigationItem.title = FriendsLocale.kNavigationTitle.localized
    }

}

// MARK: - FriendsDisplayLogic

extension FriendsViewController: FriendsDisplayLogic {

    func displayUsers() {
        contentView.tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension FriendsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {
            return FriendsTableViewCell()
        }

        if let user = users?[indexPath.row] {
            cell.setData(user)
        }

        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension FriendsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = users?[indexPath.row] else { return }
        router?.navigateToFriendDetails(user: user)
    }

}
