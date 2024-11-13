import SwiftUI

struct ActivityListView: View {
    @ObservedObject var viewModel: ActivityListViewModel

    var body: some View {
        if !viewModel.activities.items.isEmpty {
            List {
                ForEach(viewModel.activities.items) { activity in
                    if let index = viewModel.activities.items.firstIndex(of: activity) {
                        NavigationLink(destination: ActivityView(activity: $viewModel.activities.items[index])) {
                            HStack(alignment: .top, spacing: 1) {
                                Text(activity.emoji ?? "")
                                    .font(.largeTitle)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(activity.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                                    Text(activity.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Completed \(activity.timesCompleted) times")
                                        .font(.footnote)
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                    } else {
                        Text("Error: Activity not found")
                    }
                }
                .onDelete(perform: viewModel.removeItems)
            }
            .background(.gradientTheme)
            .scrollContentBackground(.hidden)
            .animation(.easeInOut, value: viewModel.activities.items.count)
        } else {
            ZStack {
                VStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Theme.primaryColor)
                    Text("You have no activities to track yet. Add some by pressing the '+' button.")
                        .padding()
                        .font(Theme.bodyFont)
                        .foregroundColor(Theme.primaryColor)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gradientTheme)
            }
        }
    }
}
