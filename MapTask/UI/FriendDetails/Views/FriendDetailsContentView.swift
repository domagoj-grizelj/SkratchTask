//
//  FriendDetailsContentView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//  
//

import UIKit

class FriendDetailsContentView: UIView {

    private let tableHeaderView = FriendDetailsHeaderView()
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension FriendDetailsContentView {

    func set(user: User) {
        tableHeaderView.set(user: user)
    }

}

// MARK: - Private Methods

private extension FriendDetailsContentView {

    func setupViews() {
        setupTableView()
        setupTableHeaderView()
    }

    func setupTableView() {
        addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(FriendDetailsTableViewCell.self, forCellReuseIdentifier: "FriendDetailsCell")
        tableView.snp.makeConstraints {
          $0.edges.equalToSuperview()
        }
    }

    func setupTableHeaderView() {
        tableView.tableHeaderView = tableHeaderView
        tableView.tableHeaderView?.snp.makeConstraints({
          $0.width.equalTo(self)
        })
    }
}
