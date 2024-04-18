//
//  YearMonthPickerView.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/18/24.
//

import SwiftUI

struct YearMonthPickerView: View {
    @ObservedObject var viewModel: DateSelectionViewModel
    @Binding var showingPicker: Bool
    @Binding var selectedDate: Date
    
    var body: some View {
        NavigationView {
            HStack {
                Picker("Year", selection: $viewModel.selectedYear) {
                    ForEach(viewModel.years, id: \.self) { year in
                        Text("\(year)년").tag(year)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("Month", selection: $viewModel.selectedMonth) {
                    ForEach(viewModel.months, id: \.self) { month in
                        Text(month).tag(month)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .navigationBarTitle(Text("날짜를 선택해 주세요"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                showingPicker = false
                
            })
        }
    }
}
