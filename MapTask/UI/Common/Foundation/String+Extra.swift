//
//  String+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 29.04.2021..
//

import Foundation
import UIKit

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "localized_string")
    }

    func getAttributedStringWithSpacing(spacing: CGFloat, alignment: NSTextAlignment) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        let keyParagraphStyle = NSAttributedString.Key.paragraphStyle
        let range = NSRange(location: 0, length: attributedString.length)
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.lineBreakMode = .byTruncatingTail
        attributedString.addAttribute(keyParagraphStyle, value: paragraphStyle, range: range)
        return attributedString
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    private mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

}
