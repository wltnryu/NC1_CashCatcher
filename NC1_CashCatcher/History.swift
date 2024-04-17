
import SwiftUI

struct History: Identifiable, Hashable {
    var icon: String
    var category: String
    var amount: Int
    let id = UUID()
}
