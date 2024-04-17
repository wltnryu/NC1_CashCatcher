//
//  HistoryModel.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/15/24.
//

import SwiftUI
import Combine

class HistoryModel : ObservableObject {
    @Published var icon: String = ""
    @Published var category: String = ""
    @Published var amount: Int = 0
}
