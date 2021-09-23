import SwiftUI

struct RootContainer: View {
    @EnvironmentObject private var navState: NavigationViewState

    @State private var tabBarHeight: CGFloat = 0
    @State private var selectedTab: BottomNavTab = .dashboard {
        willSet { print("tab: \(newValue) will be selected") }
        didSet { print("tab: \(selectedTab) has been selected") }
    }

    var body: some View {
        appContent
                .hideTabViewBar
                .environment(\.tabBarHeight, tabBarHeight)
    }

    private var appContent: some View {
        TabView(selection: $navState.bottomNavSelectedTab) {
            dashboard
                    .tag(BottomNavTab.dashboard)
                    .keepTabViewHeight(in: $tabBarHeight)

            contacts
                    .tag(BottomNavTab.contacts)
                    .keepTabViewHeight(in: $tabBarHeight)

            messages
                    .tag(BottomNavTab.messages)
                    .keepTabViewHeight(in: $tabBarHeight)

            events
                    .tag(BottomNavTab.events)
                    .keepTabViewHeight(in: $tabBarHeight)

            settings
                    .tag(BottomNavTab.settings)
                    .keepTabViewHeight(in: $tabBarHeight)
        }
    }

    private var dashboard: some  View {
        DashboardContainer(props: .init())
    }

    private var contacts: some  View {
        ContactsContainer(props: .init())
    }

    private var messages: some  View {
        MessagesContainer(props: .init())
    }

    private var events: some  View {
        EventsContainer(props: .init())
    }

    private var settings: some  View {
        SettingsContainer(props: .init())
    }
}
