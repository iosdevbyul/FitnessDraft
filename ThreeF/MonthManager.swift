//
//  MonthManager.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-11.
//

import Foundation

class MonthInfo {
    static let shard = MonthInfo()

    var month: Int = 1

    private init() {}
}

class DateManager {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current

    init() {
        print("init")
    }
    let monthDictionlary = [
                        1:"Jan",2:"Feb",3:"Mar",
                        4:"Apr",5:"May",6:"Jun",
                        7:"Jul",8:"Aug",9:"Sep",
                        10:"Oct",11:"Nov",12:"Dic"]
    
    func switchNumberToStrForMonth(numMonth: Int) -> String {
        return monthDictionlary[numMonth] ?? "Jan"
    }
    
    func weekNumber() -> Int{
        let weekOfYear = calendar.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        return weekOfYear
    }

    func getCurrentMonth() -> String {
        dateFormatter.dateFormat = "LLLL"
        let monthString = dateFormatter.string(from: date)
        
        return monthString
    }
    
    func getCurrentMonthReturnInt() -> Int {
        dateFormatter.dateFormat = "MM"
        let monthString = dateFormatter.string(from: date)
        guard let monthInt = Int(monthString) else {
            return 1
        }
        return monthInt
    }

    func getCurrentYear() -> String {
        dateFormatter.dateFormat = "YYYY"
        let yearString = dateFormatter.string(from: date)
        
        return yearString
    }

    func numberOfDaysOfThisMonth(_ year:Int, _ month:Int) -> Int{
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        return numDays
    }

    func startOfMonth(ofMonth m: Int, year y: Int) -> Int {
        let thisCalendar = Calendar(identifier: .iso8601)
        return 1
    //            let year = thisCalendar.component(.year, from: self)
    //
    //            let dateComponents = DateComponents(calendar: thisCalendar, timeZone: TimeZone(abbreviation: "UTC"), hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: 2, weekOfYear: weekNumber, yearForWeekOfYear: year)
    //            return thisCalendar.date(from: dateComponents)
    }
    
    func getStartDateOfTheWeek(weekNum: Int) {
        let components = DateComponents(weekOfYear: weekNum, yearForWeekOfYear: Int(getCurrentYear()))
        guard let date = Calendar.current.date(from: components) else {return}

        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let outputDate = df.string(from: date)
        print(outputDate)
    }
    
    func startDayOfMonth() -> Date {
        print(">>>>")
//        print(calendar.startOfDay(for: Date()))
        
        print(date.startOfDay)
        print(date.startOfMonth)
        print(date.endOfDay)
        print(date.endOfMonth)
        
        
        print(">>>>")
        
        return date.startOfMonth
        
//        let components = calendar.dateComponents([.year, .month], from: date)
//        let startOfMonth = calendar.dateFromComponents(components)!
//        print(dateFormatter.stringFromDate(startOfMonth))
        
        
        
    }
    
    func getFirstDayOfMonth(_ month: Int) -> Int{
        let fullYearString = getCurrentYear()
        let monthString = "\(month)"
        let fullString = fullYearString+"-"+monthString+"-01"
        return getDayOfWeek(fullString)
    }
    
    func getFirstDayOfMonth(_ month: Int, _ year: Int) -> Int {
        let fullString = "\(year)"+"-"+"\(month)"+"-01"
        return getDayOfWeek(fullString)
    }
    
    func getDayOfWeek(_ today:String) -> Int {
        let formatter  = DateFormatter()    // 1
        formatter.dateFormat = "yyyy-MM-dd" // 2
        guard let todayDate = formatter.date(from: today) else { return 0 }  // 3
        let myCalendar = Calendar(identifier: .gregorian)   // 4
        let weekDay = myCalendar.component(.weekday, from: todayDate) // 5
        return weekDay
    }
    
    func endDayOfMonth() -> Date {
        return date.endOfDay
    }

}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var startOfMonth: Date {

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)

        return  calendar.date(from: components)!
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
    }

    func isMonday() -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: self)
        return components.weekday == 2
    }
}
