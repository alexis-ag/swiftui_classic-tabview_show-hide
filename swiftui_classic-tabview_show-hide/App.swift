import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootContainer()
                .environmentObject(NavigationViewState())
        }
    }
}
