//
//  PageViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import UIKit

class PageViewController: UIPageViewController {

    private let contentView = PageContentView()

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [MapViewController(), FriendsTableViewController()]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        setupView()
    }

    private func setupView() {
        view.addSubview(contentView)
        dataSource = self
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

// MARK: - UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return nil
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

        return orderedViewControllers[nextIndex]
    }


}
