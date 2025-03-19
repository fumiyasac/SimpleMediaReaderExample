//
//  DateLabelFormatter.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/18.
//

import Foundation

final class DateLabelFormatter {

    // MARK: - Properties

    private static let convertDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return dateFormatter
    }()

    private static let stringDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }()

    // MARK: - Static Functions

    // APIで取得された日付フォーマットを任意の表記に変換する
    static func getDateStringFromAPI(apiDateString: String, printFormatter: String = "yyyy.MM.dd") -> String {
        guard let apiDate = convertDateFormatter.date(from: apiDateString) else {
            return "-"
        }
        stringDateFormatter.dateFormat = printFormatter
        return stringDateFormatter.string(from: apiDate)
    }
}
