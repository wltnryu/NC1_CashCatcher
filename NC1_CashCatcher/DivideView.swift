//
//  DivideView.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/14/24.
//

import SwiftUI
import Foundation
import SwiftData

struct DivideView: View {
    
    var week = ["일시불", "2주", "3주", "4주", "5주"]
    @State var dividedAmount: Int = 0
    
    @EnvironmentObject var historyModel : HistoryModel
    @EnvironmentObject var historyData : HistoryData
    
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [Expenses]
    
    @State private var selectedWeek = "일시불"
    @Binding var isPresented: Bool
    @Binding var expense : Int
    
    var body: some View {
        VStack {
            HStack {
                Text("몇 주 할부로 계산할까요?")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.bottom, 5)
                Spacer()
            }.padding(.top, 47)
            HStack {
                Text("선택한 주수로 소비 금액이 나누어져요.")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color(hex: 0x9E9E9E))
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.bottom, 25)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: 0xD9D9D9), lineWidth: 1)
                    .frame(width: 361, height: 256)
                    .foregroundColor(Color.white.opacity(0))
                
                Picker("할부를 선택해 주세요", selection: $selectedWeek) {
                    ForEach(week, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(WheelPickerStyle())
            }
            
            Spacer()
            
            Button(action: {
                
                if selectedWeek == "일시불" {
                    let amount = Double(historyModel.amount)
                    self.dividedAmount = roundUpToTensPlace(amount)
                    expense = expense - self.dividedAmount
                }
                else if selectedWeek == "2주" {
                    let dividedAmount = Double(historyModel.amount) / 2
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    expense = expense - self.dividedAmount
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "3주" {
                    let dividedAmount = Double(historyModel.amount) / 3
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    expense = expense - self.dividedAmount
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "4주" {
                    let dividedAmount = Double(historyModel.amount) / 4
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    expense = expense - self.dividedAmount
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "5주" {
                    let dividedAmount = Double(historyModel.amount) / 5
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    expense = expense - self.dividedAmount
                }
                
//                if currentWeekNumber() == 1 {
//                    print("firstWeek : \(expenses[0].firstWeek_ex)")
//                    expenses[0].firstWeek_ex = expenses[0].firstWeek_ex - self.dividedAmount
//                } else if currentWeekNumber() == 2 {
//                    print("secondWeek : \(expenses[0].secondWeek_ex)")
//                    expenses[0].secondWeek_ex = expenses[0].secondWeek_ex - self.dividedAmount
//                } else if currentWeekNumber() == 3 {
//                    print("thirdWeek : \(expenses[0].thirdWeek_ex)")
//                    expenses[0].thirdWeek_ex = expenses[0].thirdWeek_ex - self.dividedAmount
//                } else if currentWeekNumber() == 4 {
//                    print("fourthWeek : \(expenses[0].fourthWeek_ex)")
//                    expenses[0].fourthWeek_ex = expenses[0].fourthWeek_ex - self.dividedAmount
//                } else if currentWeekNumber() == 5 {
//                    print("fifthWeek : \(expenses[0].fifthWeek_ex)")
//                    expenses[0].fifthWeek_ex = expenses[0].fifthWeek_ex - self.dividedAmount
//                }
                
                //예시
                print("잔여 생활비: \(expenses[0].thirdWeek_ex - self.dividedAmount)")
                
                let history = History(icon: historyModel.icon, category: historyModel.category, amount: dividedAmount)
                
                // 현재 날짜를 생성
                let currentDate = Date()

                // 현재 날짜를 "M/d(EEE)" 형식의 문자열로 변환
                let dateString = formattedDate(date: currentDate)

                // 변환된 문자열 날짜와 함께 addHistory 함수 호출
                historyData.addHistory(history: history, date: dateString)

                
                isPresented = false
                
                
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 361, height: 67)
                        .foregroundColor(Color(hex: 0xFF9500))
                    
                    Text("저장")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
            })
        }.onAppear {
            
            if currentWeekNumber() == 1 {
                print("firstWeek : \(expenses[0].firstWeek_ex)")
            } else if currentWeekNumber() == 2 {
                print("secondWeek : \(expenses[0].secondWeek_ex)")
            } else if currentWeekNumber() == 3 {
                print("thirdWeek : \(expenses[0].thirdWeek_ex)")
            } else if currentWeekNumber() == 4 {
                print("fourthWeek : \(expenses[0].fourthWeek_ex)")
            } else if currentWeekNumber() == 5 {
                print("fifthWeek : \(expenses[0].fifthWeek_ex)")
            }
        }
    }
    
    func roundUpToTensPlace(_ value: Double) -> Int {
        let roundedValue = (value / 10).rounded(.up) * 10
        return Int(roundedValue)
    }
    
    func currentWeekNumber() -> Int {
        let calendar = Calendar.current
        let date = Date()
        let weekNumber = calendar.component(.weekOfMonth, from: date)
        return weekNumber
    }

}
