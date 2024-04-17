//
//  Consumption.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/17/24.
//

import Foundation
import SwiftData

@Model
final class Consumption {
    var icon : String
    var category : String
    var amount : Int
    
    init(icon: String, category: String, amount: Int) {
        self.icon = icon
        self.category = category
        self.amount = amount
    }
}
