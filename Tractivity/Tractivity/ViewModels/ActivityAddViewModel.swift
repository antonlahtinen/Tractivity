import Foundation
import SwiftUI

class ActivityAddViewModel: ObservableObject {
    @Published var name = ""
    @Published var emoji = ""
    @Published var description = ""
    @Published var timesCompleted = 0

    var activities: Activities

    init(activities: Activities) {
        self.activities = activities
    }

    func saveActivity() {
        let item = ActivityItem(name: name, emoji: emoji, description: description, timesCompleted: timesCompleted)
        activities.items.append(item)
    }
}
