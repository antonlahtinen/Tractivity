import Foundation
import SwiftUI

class ActivityListViewModel: ObservableObject {
    @Published var activities: Activities

    init(activities: Activities) {
        self.activities = activities
    }

    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}
