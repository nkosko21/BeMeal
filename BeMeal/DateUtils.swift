//
//  DateUtils.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/25/23.
//

import Foundation

extension Date {
    public func setTime(hour: Int, min: Int, sec: Int) -> Date? {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)

        components.timeZone = TimeZone.current
        components.hour = hour
        components.minute = min
        components.second = sec

        return cal.date(from: components)
    }
}
