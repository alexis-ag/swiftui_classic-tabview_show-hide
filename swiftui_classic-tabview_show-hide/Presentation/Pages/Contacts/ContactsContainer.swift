import SwiftUI

struct ContactsContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            pageContent()
                    .navigationTitle("Contacts")
        }
    }

    @ViewBuilder
    private func pageContent() -> some View {
        VStack {
            Text("Contacts container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
        }
    }
}
