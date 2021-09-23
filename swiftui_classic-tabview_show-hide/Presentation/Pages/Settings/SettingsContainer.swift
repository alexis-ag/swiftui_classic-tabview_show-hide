import SwiftUI

struct SettingsContainer: View {
    let props: Props

    var body: some View {
        NavigationView {
            SettingsView(props: .init())
                    .navigationTitle("Settings")
                    .bottomNav(enabled: .constant(true))
        }
    }
}
