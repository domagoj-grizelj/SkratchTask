//
//  DateTools.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 02.05.2021..
//

import Foundation


struct DateTools {

    static func getFormattedStringFrom(dateString: String?) -> String? {
        guard let dateString = dateString else { return nil }

        let dateFormatter = isoDateFormatter()
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none

        return dateFormatter.string(from: date)
    }

    static func getFormattedDateAndTimeFrom(dateString: String?) -> String? {
        guard let dateString = dateString else { return nil }

        let dateFormatter = isoDateFormatter()
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        return dateFormatter.string(from: date)
    }

    private static func isoDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }

}
