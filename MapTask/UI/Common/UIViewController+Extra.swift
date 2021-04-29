//
//  UIViewController+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import UIKit

// MARK: - Navigation Style Methods
extension UIViewController {

    func setSolidNavigationStyle(withBackgroundColor backgroundColor: UIColor, tintColor: UIColor, shadowColor: UIColor?) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.barTintColor = backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
        transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.navigationController?.view.backgroundColor = backgroundColor
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .any, barMetrics: .default)
            if let shadowColor = shadowColor {
                self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: shadowColor)
            } else {
                self.navigationController?.navigationBar.shadowImage = nil
            }
        }, completion: nil)
    }

    func registerForKeyboardWillShowNotification(usingBlock block: ((Notification, CGSize) -> Void)? = nil) {
        _ = NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillShowNotification, object: nil, queue: nil) { (notification) -> Void in
            let userInfo = notification.userInfo!
            guard let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size else { return }
            block?(notification, keyboardSize)
        }
    }

    func registerForKeyboardWillHideNotification(usingBlock block: ((Notification) -> Void)? = nil) {
        _ = NotificationCenter.default.addObserver(forName: UIWindow.keyboardWillHideNotification, object: nil, queue: nil, using: { (notification) -> Void in
            block?(notification)
        })
    }
}

