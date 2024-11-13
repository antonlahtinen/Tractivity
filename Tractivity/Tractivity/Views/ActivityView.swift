import SwiftUI

struct ActivityView: View {
    @Binding var activity: ActivityItem
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
                Color.gradientTheme
                    .ignoresSafeArea()
                    
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // Activity details card
                    VStack(spacing: 20) {

                        // Activity name
                        Text(activity.displayName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.9))
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        
                        
                        
                        // Activity description
                        Text(activity.description)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black.opacity(0.9))
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(
                        // Glass-like background effect
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.1))
                            .blur(radius: 10)
                    )
                    .padding()
                    
                    Spacer()
                    
                    Text("Completed \(activity.timesCompleted) times")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    // Mark as Done button
                    Button(action: {
                        withAnimation(.spring()) {
                            activity.timesCompleted += 1
                        }
                    }) {
                        Text("Mark as Done")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.85))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            .navigationTitle(activity.displayName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ActivityView(activity: .constant(ActivityItem(name: "Running", emoji: "🏃‍♂️", description: "A nice run in the park", timesCompleted: 5)))
}
