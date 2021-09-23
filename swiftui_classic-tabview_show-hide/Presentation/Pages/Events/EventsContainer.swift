import SwiftUI

struct EventsContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            EventsView(props: .init())
                    .navigationTitle("Events")
                    .bottomNav(enabled: .constant(true))
        }
    }
}
