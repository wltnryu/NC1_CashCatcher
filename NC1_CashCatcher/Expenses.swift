//
//  Expenses.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/17/24.
//

import Foundation
import SwiftData

@Model
class Expenses {
    // 나중에 연 정보도 저장해야 할 것 같음!
    @Attribute(.unique) var month : Int
    var month_ex : Int
    var firstWeek_ex : Int
    var secondWeek_ex : Int
    var thirdWeek_ex : Int
    var fourthWeek_ex : Int
    var fifthWeek_ex : Int
    
    init(month: Int, month_ex: Int, firstWeek_ex: Int, secondWeek_ex: Int, thirdWeek_ex: Int, fourthWeek_ex: Int, fifthWeek_ex: Int) {
        self.month = month
        self.month_ex = month_ex
        self.firstWeek_ex = firstWeek_ex
        self.secondWeek_ex = secondWeek_ex
        self.thirdWeek_ex = thirdWeek_ex
        self.fourthWeek_ex = fourthWeek_ex
        self.fifthWeek_ex = fifthWeek_ex
    }
}
