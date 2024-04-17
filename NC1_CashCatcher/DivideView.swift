//
//  DivideView.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/14/24.
//

import SwiftUI
import Foundation

struct DivideView: View {
    
    var week = ["일시불", "2주", "3주", "4주", "5주"]
    @State var dividedAmount: Int = 0
    
    @EnvironmentObject var historyModel : HistoryModel
    @EnvironmentObject var historyData : HistoryData
    
    @State private var selectedWeek = ""
    @Binding var isPresented: Bool
    
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
                    print(historyModel.amount)
                    
                    self.dividedAmount = historyModel.amount
                } else if selectedWeek == "2주" {
                    var dividedAmount = Double(historyModel.amount) / 2
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "3주" {
                    let dividedAmount = Double(historyModel.amount) / 3
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "4주" {
                    let dividedAmount = Double(historyModel.amount) / 4
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    
                    print(roundUpToTensPlace(dividedAmount))
                } else if selectedWeek == "5주" {
                    let dividedAmount = Double(historyModel.amount) / 5
                    
                    self.dividedAmount = roundUpToTensPlace(dividedAmount)
                    
                    print(roundUpToTensPlace(dividedAmount))
                }
                
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
            print("DivideView onAppear: \(isPresented)")
        }
    }
    
    func roundUpToTensPlace(_ value: Double) -> Int {
        let roundedValue = (value / 10).rounded(.up) * 10
        return Int(roundedValue)
    }

}

struct DivideView_Previews : PreviewProvider {
    static var previews: some View {
        DivideView(isPresented: .constant(true))
    }
}
