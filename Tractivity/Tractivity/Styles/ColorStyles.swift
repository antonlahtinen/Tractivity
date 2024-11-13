import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    
    static var gradientTheme: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.4)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
            )
    }
}
