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
    private let user: User

    init(delegate: FriendDetailsRouterDelegate?, user: User) {
        self.user = user
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
        contentView.set(user: user)
    }

}

// MARK: - UITableViewDataSource

extension FriendDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendDetailsCell", for: indexPath) as? FriendDetailsTableViewCell else {
          return FriendDetailsTableViewCell()
        }

        if indexPath.row == 0 {
            let title = "\(user.gender?.capitalizingFirstLetter() ?? ""), \(user.dob?.age ?? 0)"
            let subtitle = DateTools.getFormattedStringFrom(dateString: user.dob?.date)
            cell.set(icon: Assets.kBalloonIcon.image, title: title, subtitle: subtitle)

        } else if indexPath.row == 1 {
            let title = "\(user.location?.street?.number ?? 0) \(user.location?.street?.name ?? "")"
            let subtitle = "\(user.location?.city ?? ""), \(user.location?.state ?? ""), \(user.location?.country ?? "")"
            cell.set(icon: Assets.kPinIcon.image, title: title, subtitle: subtitle)
        }

        return cell
    }

}

