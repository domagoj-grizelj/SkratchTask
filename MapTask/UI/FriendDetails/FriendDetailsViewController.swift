//
//  FriendDetailsViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//  
//

import UIKit

protocol FriendDetailsDisplayLogic: AnyObject {

}

class FriendDetailsViewController: UIViewController {

    var interactor: FriendDetailsBusinessLogic?
    var router: FriendDetailsRoutingLogic?
    private lazy var contentView = FriendDetailsContentView()

    init(delegate: FriendDetailsRouterDelegate?) {
        super.init(nibName: nil, bundle: nil)
        let interactor = FriendDetailsInteractor()
        let presenter = FriendDetailsPresenter()
        let router = FriendDetailsRouter()
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.delegate = delegate
        self.interactor = interactor
        self.router = router
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

// MARK: - Display Logic

extension FriendDetailsViewController: FriendDetailsDisplayLogic {

}

// MARK: - Private Methods

private extension FriendDetailsViewController {

    func setupViews() {
        setupContentView()
    }

    func setupContentView() {
        contentView.tableView.dataSource = self
    }

}

// MARK: - UITableViewDataSource

extension FriendDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

