//
//  ShiftPresenter.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/8/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class ShiftPresenter {
    typealias Date = (hour: Int, minute: Int, day: Int, weekday: Int, month: Int, year: Int)
    let shift: Shift!
    var day: Int!
    var weekday: Int!
    var month: String!
    var monthNum: Int!
    var year: Int!
    var hour: Int!
    var minute: Int!
    
    let months = ["Januar", "Februar", "März", "April", "Mai", "Juni",
                  "Juli", "August", "September", "Oktober", "November", "Dezember"]
    
    let days = ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"]
    
    init(shift: Shift) {
        self.shift = shift
        let date = startDateFromShift(shift)
        day = date.day
        weekday = date.weekday
        hour = date.month
        year = date.year
        minute = date.minute
        monthNum = date.month
        month = monthStringFromInt(date.month)
    }
    
    func volunteersOutOfLabelText() -> String {
        return "\(shift.volunteersCount)/\(shift.volunteersNeeded)"
    }
    
    func timespanLabelText() -> String {
        let start = startDateFromShift(shift)
        let end = endDateFromShift(shift)
        return "\(padZeros(start.hour)):\(padZeros(start.minute)) - \(padZeros(end.hour)):\(padZeros(end.minute))"
    }
    
    func dateString() -> String {
        // should look "Mo. 20. Juni 2016"
        let dayString = days[weekday - 1]
        return "\(dayString). \(day). \(month) \(year)"
    }
    
    private func padZeros(digits: Int) -> String {
        return String(format: "%02d", digits)
    }
    
    private func monthStringFromInt(month: Int) -> String {
        return months[month-1]
    }
    
    private func startDateFromShift(shift: Shift) -> Date {
       return getDate(shift.startsAt)
    }
    
    private func endDateFromShift(shift: Shift) -> Date {
       return getDate(shift.endsAt)
    }
    
    private func getDate(date: NSDate) -> Date {
        let components = NSCalendar.currentCalendar().components([.Day, .Month, .Year, .Hour, .Minute, .Weekday], fromDate: date)
        let day = components.day
        let weekday = components.weekday
        let month = components.month
        let hour = components.hour
        let minute = components.minute
        let year = components.year
        return (hour, minute, day, weekday, month, year)
    }
}