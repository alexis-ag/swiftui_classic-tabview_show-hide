import SwiftUI

struct ContactsView: View {
    let props: Props

    var body: some View {
        VStack {
            Spacer()
            Text("Contacts container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
            Spacer()
        }

    }
}
