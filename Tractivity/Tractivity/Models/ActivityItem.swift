import Foundation

struct ActivityItem: Codable, Identifiable, Hashable, Equatable {
    
    var id = UUID()
    let name: String
    let emoji: String?
    let description: String
    var timesCompleted: Int

    
    var displayName: String {
        "\(name) \(emoji ?? "")"
    }
}
