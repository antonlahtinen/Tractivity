import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ActivityListViewModel(activities: Activities())
    @State private var showingAddActivity = false

    var body: some View {
        NavigationStack {
            ActivityListView(viewModel: viewModel)
                .navigationTitle("Tractivity")
                .toolbar {
                    Button(action: {
                        showingAddActivity = true
                    }) {
                        Label("Add Activity", systemImage: "plus.circle.fill")
                            .labelStyle(.titleAndIcon)
                            .foregroundColor(Theme.accentColor)
                    }
                }
                .sheet(isPresented: $showingAddActivity) {
                    ActivityAddView(viewModel: ActivityAddViewModel(activities: viewModel.activities))
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}





#Preview {
    ContentView()
}
