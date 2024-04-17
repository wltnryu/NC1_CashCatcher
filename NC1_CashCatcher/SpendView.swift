
import SwiftUI

struct SpendView : View {
    @State var value = 0
    @State private var spendTag : Bool = false
    
    @Binding var isPresented: Bool
    
    @EnvironmentObject var historyModel : HistoryModel
    
    private var numberFormatter : NumberFormatter
        
    init(numberFormatter: NumberFormatter = NumberFormatter(), isPresented: Binding<Bool>) {
        self.numberFormatter = numberFormatter
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.maximumFractionDigits = 0
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("소비 금액은 얼마인가요?")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.bottom, 5)
                Spacer()
            }.padding(.top, 47)
            HStack {
                Text("선택한 항목의 지출 금액을 적어주세요.")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color(hex: 0x9E9E9E))
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.bottom, 25)
            
            HStack {
                CurrencyTextField(numberFormatter: numberFormatter, value: $value)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(hex: 0xBFBFBF), lineWidth: 1))
                    .frame(height: 80)
            }
            .padding([.leading, .trailing], 16)
            
            Spacer()
            /*
            ZStack{
                NavigationLink(destination: DivideView(), isActive: $spendTag) {
                    EmptyView()
                }.navigationTitle("")
            }
             */
            
            Button(action: {
                
                historyModel.amount = value
                
                spendTag = true
                
                print("SpendView Btn Clicked: \(spendTag)")
                
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 361, height: 67)
                        .foregroundColor(Color(hex: 0xFF9500))
                    
                    Text("다음")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
            })
            
            NavigationLink(destination: DivideView(isPresented: $isPresented), isActive: $spendTag) {
                EmptyView()
            }
            
        }.onAppear {
            print("SpendView onAppear: \(spendTag)")
        }
    }
}

struct SpendView_Previews : PreviewProvider {
    static var previews: some View {
        SpendView(isPresented: .constant(true))
    }
}
