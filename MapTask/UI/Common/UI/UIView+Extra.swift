//
//  UIView+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//

import UIKit

// MARK: - Animations

extension UIView {

    func animateTouchDown() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.0,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
                       }, completion: { _ in

                       })
    }

    func animateTouchUp() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.0,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
                       }, completion: { _ in

                       })
    }

    func animateAlongsideKeyboard(notif: Notification) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(notif.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0)
        UIView.setAnimationCurve(UIView.AnimationCurve(rawValue: 7)!)
        UIView.setAnimationCurve(UIView.AnimationCurve(rawValue: notif.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int ?? 7) ?? UIView.AnimationCurve(rawValue: 7)!)
        layoutIfNeeded()
        UIView.commitAnimations()
    }

}
