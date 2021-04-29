//
//  FriendsViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import UIKit

class FriendsViewController: UIViewController {

    private lazy var contentView = FriendsContentView()

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
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.reloadData()
    }

    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        setSolidNavigationStyle(withBackgroundColor: .white, tintColor: .black, shadowColor: .white)
    }

}

extension FriendsViewController: UITableViewDelegate {

}

extension FriendsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell else {
          return FriendsTableViewCell()
        }

        return cell
    }


}
