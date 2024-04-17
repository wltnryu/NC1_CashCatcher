

import SwiftUI
import Combine
import SwiftData

class HistoryData: ObservableObject {
    @Published var historyDictionary: [String: [History]] = [
        formattedDate(date: createDate(day: 9, month: 4)) : [
            History(icon: "list_makeup", category: "미용", amount: 11900),
            History(icon: "list_phone", category: "통신", amount: 94550),
            History(icon: "list_makeup", category: "미용", amount: 2500)
        ],
        formattedDate(date: createDate(day: 8, month: 4)) : [
            History(icon: "list_fork", category: "식사", amount: 3500),
            History(icon: "list_health", category: "건강", amount: 61200)
        ],
        formattedDate(date: createDate(day: 13, month: 4)) : [
            History(icon: "list_celebrate", category: "유흥", amount: 24000),
        ],
        formattedDate(date: createDate(day: 14, month: 4)) : [
            History(icon: "list_house", category: "생활", amount: 10000),
            History(icon: "list_fork", category: "식사", amount: 2000)
        ]
    ]

    func addHistory(history: History, date: String) {
        var newHistory = historyDictionary[date] ?? []
        // 배열의 시작 부분에 새로운 History 객체를 추가합니다.
        newHistory.insert(history, at: 0)
        // historyDictionary에 새로운 배열을 할당하여 SwiftUI가 변경을 감지하도록 합니다.
        historyDictionary[date] = newHistory
        // 전체 dictionary를 새로운 인스턴스로 업데이트하여 변경사항을 명시적으로 반영합니다.
        historyDictionary = historyDictionary
    }
}


struct ContentView: View {
    
    @EnvironmentObject var historyData : HistoryData
    
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [Expenses]
    
    @State var isPresented: Bool = false
    @State var isChangePresented: Bool = false
    @State private var showingPicker = false
    @State private var showingSheet = false
    @State var expense : Int = 0
    
    @State private var selectedDate: Date = .now
    
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월"
        return formatter
    }()
    
    private var today = Date()
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer(minLength: 46)
                HStack {
                    Text("\(today, formatter: ContentView.dateformat)")
                        .font(.system(size: 32, weight: .semibold))
                        .padding(.trailing, 8)
                        .padding(.leading, 26)
                        .foregroundColor(.black)
                    Button(action: {
                        
                        showingPicker = true
                        
                    }, label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 17, height: 22)
                            .foregroundColor(Color(hex: 0xBFBFBF))
                            .font(.system(size: 22, weight: .light))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        isPresented = true
                        
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(hex: 0xBFBFBF))
                            .fullScreenCover(isPresented: $isPresented, content: {
                                CategoryView(isPresented: $isPresented, expense: $expense)
                            })
                    })
                    .padding(.trailing, 26)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .frame(width: 361, height: 111)
                        .foregroundColor(Color(hex: 0xFF9500))
                    
                    VStack {
                        HStack {
                            Text("이번주 잔여 생활비는")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.white)
                                .padding(.leading, 21)
                            
                            Spacer()
                            
                            Button(action: {
                                self.showingSheet = true
                            }, label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }).padding(.trailing, 19)
                                .actionSheet(isPresented: $showingSheet) {
                                    ActionSheet(title: Text("원하는 옵션을 선택해 주세요."), buttons: [.default(Text("목표 생활비 수정"), action: {
                                        isChangePresented = true
                                    }), .cancel(Text("취소"))])
                                }
                                .fullScreenCover(isPresented: $isChangePresented, content: {
                                    ChangeView()
                                })
                        }
                        
                        HStack {
                            Text("\(expense)원")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.leading, 28)
                        .padding(.top, 1)
                    }
                }
                .frame(width: 361, height: 111)
                
                Rectangle()
                    .frame(height: 8)
                    .foregroundColor(Color(hex: 0xE5E5EA))
                    .padding(.top, 23)

                List {
                    ForEach(Array(historyData.historyDictionary.keys.sorted(by: { dateFromString($0)! > dateFromString($1)! })), id: \.self) { dateString in
                        Section(header: Text(dateString)){
                            ForEach(historyData.historyDictionary[dateString]!, id: \.self) { history in
                                HistoryRow(history: history)
                            }
                        }
                    }
                }
                .listStyle(.inset)
                .environment(\.defaultMinListRowHeight, 80)

            }// 'selectedDate'가 변경될 때, 이제 String으로 변환하여 사용합니다.
            .onChange(of: selectedDate) {
                let dateString = formattedDate(date: selectedDate)
                // dateString을 사용하는 로직...
            }
            .blur(radius: showingPicker ? 2 : 0)
            
            if showingPicker {
                Color.primary
                    .ignoresSafeArea()
                    .opacity(0.1)
                    .onTapGesture {
                        showingPicker = false
                    }
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .padding(8)
                    .background(.bar)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .transition(.scale)
                    .padding()
                    .accentColor(Color(hex: 0xFF9500))
            }
        }.animation(.easeInOut, value: showingPicker)
            .onAppear {
                
                // 일시적인 값 > 수정 필요
                expenses[0].firstWeek_ex = 100000
                expenses[0].secondWeek_ex = 100000
                expenses[0].thirdWeek_ex = 100000
                expenses[0].fourthWeek_ex = 100000
                expenses[0].fifthWeek_ex = 100000
                
                if currentWeekNumber() == 1 {
                    expense = expenses[0].firstWeek_ex
                }
                else if currentWeekNumber() == 2 {
                    expense = expenses[0].secondWeek_ex
                }
                else if currentWeekNumber() == 3 {
                    expense = expenses[0].thirdWeek_ex
                }
                else if currentWeekNumber() == 4 {
                    expense = expenses[0].fourthWeek_ex
                }
                else if currentWeekNumber() == 4 {
                    expense = expenses[0].fourthWeek_ex
                }
                
            }
    }
}

func createDate(day: Int, month: Int) -> Date {
    let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.year = calendar.component(.year, from: Date())
        components.month = month
        components.day = day
        components.hour = 0 // 시간을 0으로 설정
        components.minute = 0 // 분을 0으로 설정
        components.second = 0 // 초를 0으로 설정
        components.nanosecond = 0 // 나노초를 0으로 설정
    return calendar.date(from: components) ?? Date()
}

func formattedDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d(EEE)"
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.string(from: date)
}

func currentWeekNumber() -> Int {
    let calendar = Calendar.current
    let date = Date()
    let weekNumber = calendar.component(.weekOfMonth, from: date)
    return weekNumber
}

// 날짜 문자열을 Date 객체로 변환하는 함수
func dateFromString(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d(E)"
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.date(from: dateString)
}
