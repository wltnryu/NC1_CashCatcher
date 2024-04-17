//
//  Histories.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/17/24.
//

import Foundation
import SwiftData

@Model
class Histories {
    var createdDay : Int
    var createdMonth : Int
    
    @Relationship var consumptions : [Consumption]
    
    init(createdDay: Int, createdMonth: Int, consumptions: [Consumption]) {
        self.createdDay = createdDay
        self.createdMonth = createdMonth
        self.consumptions = consumptions
    }
}
