import SwiftUI

struct MessagesContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            MessagesView(props: .init(
                    ownerName: "The owner name",
                    fakeMsgsCount: 1000
            ))
                    .navigationTitle("Messages")
                    .bottomNav(enabled: .constant(true))
        }
    }
}