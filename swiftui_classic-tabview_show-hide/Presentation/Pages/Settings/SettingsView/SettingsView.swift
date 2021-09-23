import SwiftUI

struct SettingsView: View {
    let props: Props

    var body: some View {
        VStack {
            Spacer()
            Text("Settings container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
            Spacer()
        }

    }
}