import SwiftUI

class NavigationViewState: ObservableObject {
    @Published var bottomNavSelectedTab: BottomNavTab = .dashboard
}
