

import SwiftUI
import SwiftData

@main
struct NC1_CashCatcherApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HistoryModel())
                .environmentObject(HistoryData())
        }
    }
}
