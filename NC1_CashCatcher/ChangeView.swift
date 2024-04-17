
import SwiftUI

struct ChangeView : View {
    @State var value = 0
    @State private var amount = 50000
    
    @State var isPresented : Bool = false
    @State var block : Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    private var numberFormatter : NumberFormatter
    
    init(numberFormatter: NumberFormatter = NumberFormatter()) {
        self.numberFormatter = numberFormatter
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.maximumFractionDigits = 0
    }
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "multiply")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .light))
            })
            .padding(16)
            
            Spacer()
        }.padding(.bottom, 19)
        
        HStack {
            Text("목표 생활비를 변경할까요?")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.bottom, 5)
            Spacer()
        }
        
        HStack {
            Text("목표 생활비는 이번 달 사용 금액보다\n적게 설정할 수 없어요.")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color(hex: 0x9E9E9E))
                .padding(.leading, 16)
            Spacer()
        }
        .padding(.bottom, 25)
        
        HStack {
            
            if block {
                CurrencyTextField(numberFormatter: numberFormatter, value: $value)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(hex: 0xFF9500), lineWidth: 2))
                    .frame(height: 80)
            }
            else {
                CurrencyTextField(numberFormatter: numberFormatter, value: $value)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(hex: 0xBFBFBF), lineWidth: 1))
                    .frame(height: 80)
            }
        }
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 10)
        
        if block {
            HStack {
                Text("\(amount)원")
                    .foregroundColor(Color(hex: 0xFF9500))
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.leading, 28)
                Text("보다 크게 설정해 주세요!")
                    .foregroundColor(Color(hex: 0x8A8A8E))
                    .font(.system(size: 20, weight: .regular))
                
                Spacer()
            }
            
        } else {
            
            HStack{
                Text("이번 달 사용 금액:")
                    .foregroundColor(Color(hex: 0x8A8A8E))
                    .font(.system(size: 20, weight: .regular))
                    .padding(.leading, 28)
                Text("\(amount) 원")
                    .foregroundColor(Color(hex: 0xFF9500))
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
            }
        }
        
        Spacer()
        
        Button(action: {
            if amount <= value {
                isPresented = true
                print(value)
            } else {
                block = true
                print(value)
            }
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 361, height: 67)
                    .foregroundColor(Color(hex: 0xFF9500))
                
                Text("변경")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
        }).fullScreenCover(isPresented: $isPresented, content: {
            ContentView()
        })
        .transaction({ transaction in
            transaction.disablesAnimations = true
        })
    }
}

#Preview {
    ChangeView()
}
