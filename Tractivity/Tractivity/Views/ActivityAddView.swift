import SwiftUI

struct ActivityAddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ActivityAddViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section("What do you want to track?") {
                    TextField("Name", text: $viewModel.name)
                }
                Section("Add emoji to make it more fun!") {
                    TextField("Emoji (Optional)", text: $viewModel.emoji)
                }
                Section("Give a short description of the activity") {
                    TextField("Description", text: $viewModel.description)
                }
                Section("How many times have you completed this activity already?") {
                    Stepper("Times completed: \(viewModel.timesCompleted)", value: $viewModel.timesCompleted, in: 0...100_000)
                }
            }
            .background(.gradientTheme)
            .scrollContentBackground(.hidden)
            .navigationTitle("Add new activity")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.saveActivity()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ActivityAddView(viewModel: ActivityAddViewModel(activities: Activities()))
}
