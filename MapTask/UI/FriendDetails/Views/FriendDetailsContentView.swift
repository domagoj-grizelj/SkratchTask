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
//        tableView.register(EventListTableViewCell.self, forCellReuseIdentifier: Constants.TableCells.kEventCell)
        tableView.snp.makeConstraints {
          $0.edges.equalToSuperview()
        }
    }

    func setupTableHeaderView() {
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        tableView.tableHeaderView = tableHeaderView
        tableView.tableHeaderView?.snp.makeConstraints({
          $0.width.equalTo(self)
          $0.height.equalTo(200)
        })
    }
}
