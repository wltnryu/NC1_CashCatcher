
import SwiftUI

struct HistoryRow: View {
    
    let history: History
    
    var body: some View {
        HStack {
            Image(history.icon)
                .resizable()
                .frame(width: 46, height: 46)
                .padding(.trailing, 5)
            
            Text(history.category)
                .font(.system(size: 20, weight: .regular))
            
            Spacer()
            
            Text("-\(history.amount)원")
                .font(.system(size: 24, weight: .semibold))
        }
        .alignmentGuide(
                        .listRowSeparatorLeading
        ) { dimensions in
            dimensions[.leading]
        }
    }
}
