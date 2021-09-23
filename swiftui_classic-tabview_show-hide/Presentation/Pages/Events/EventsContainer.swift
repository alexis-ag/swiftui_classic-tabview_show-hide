import SwiftUI

struct EventsContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            pageContent()
                    .navigationTitle("Events")
        }
    }

    @ViewBuilder
    private func pageContent() -> some View {
        VStack {
            Text("Events container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
        }
    }
}
