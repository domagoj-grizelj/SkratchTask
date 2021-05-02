//
//  FriendsContentView.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import UIKit

class FriendsContentView: UIView {

    // MARK: - Properties

    let tableView = UITableView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup Views

private extension FriendsContentView {

    func setupViews() {
        setupTableView()
    }

    func setupTableView() {
        addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = 70
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "friendsCell")
        tableView.contentInset.bottom = 80
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
