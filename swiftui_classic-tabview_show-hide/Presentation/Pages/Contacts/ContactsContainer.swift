import SwiftUI

struct ContactsContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            ContactsView(props: .init())
                    .navigationTitle("Contacts")
                    .bottomNav(enabled: .constant(true))
        }
    }
}
