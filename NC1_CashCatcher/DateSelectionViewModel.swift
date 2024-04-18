//
//  DateSelectionViewModel.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/18/24.
//

import SwiftUI
import Combine

class DateSelectionViewModel: ObservableObject {
    var years: [Int] = []
    var months: [String] = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    
    @Published var selectedYear: Int
    @Published var selectedMonth: String
    
    init() {
        let currentYear = Calendar.current.component(.year, from: Date())
        years = Array(1990...currentYear)
        selectedYear = currentYear
        selectedMonth = "1월"
    }
}

