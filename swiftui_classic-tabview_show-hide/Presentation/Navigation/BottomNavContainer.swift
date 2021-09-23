import SwiftUI

struct BottomNavContainer: View {
    @EnvironmentObject var navState: NavigationViewState

    var body: some View {
        CustomTabView(
                props: .init(
                        selectedNavBarTab: navState.bottomNavSelectedTab,
                        items: buildNavigationItems(),
                        onTap: { item in
                            navState.bottomNavSelectedTab = item
                        },
                        onLongTap: { item in
                            navState.bottomNavSelectedTab = item
                        }
                )
        )
    }

    private func buildNavigationItems() -> [BottomNavTabItem] {
        [
            BottomNavTabItem(type: .dashboard),
            BottomNavTabItem(type: .contacts),
            BottomNavTabItem(type: .events),
            BottomNavTabItem(type: .messages, badge: Int.random(in: 0...2000)),
            BottomNavTabItem(type: .settings),
        ]
    }
}
