
import SwiftUI

struct History: Identifiable, Hashable {
    var icon: String
    var category: String
    var amount: Int
    let id = UUID()
    var date: Date
    
    var isSameDate: Bool {
        var someDay = Calendar.current.startOfDay(for: Date())
        var thisDay = Calendar.current.startOfDay(for: date)
        return someDay == thisDay
    }
}
