import SwiftUI

struct EventsView: View {
    let props: Props

    var body: some View {
        VStack {
            Spacer()
            Text("Events container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
            Spacer()
        }
    }
}
