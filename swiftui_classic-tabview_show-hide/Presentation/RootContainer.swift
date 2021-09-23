import SwiftUI

struct RootContainer: View {
    @State private var selectedNavBarTab: BottomNavTab = .dashboard {
        willSet {
            if newValue != selectedNavBarTab {
                print("do some reaction on become change navigation")
            }
        }
        didSet {
            print("do some reaction on navigation did changed")
        }
    }

    var body: some View {
        ZStack(alignment: .top) {
            appContent
            navigation
        }
    }

    private var appContent: some View {
        TabView(selection: $selectedNavBarTab) {
            dashboard
                    .tag(BottomNavTab.dashboard)

            contacts
                    .tag(BottomNavTab.contacts)

            messages
                    .tag(BottomNavTab.messages)

            events
                    .tag(BottomNavTab.events)

            settings
                    .tag(BottomNavTab.settings)
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

    private var navigation: some View {
        CustomTabView(
                props: .init(
                        selectedNavBarTab: selectedNavBarTab,
                        items: [.dashboard, .contacts, .events, .messages, .settings],
                        defaultColor: Color(r: 142, g: 142, b: 147, a: 1),
                        accentColor: Color.accentColor,
                        onTap: { item in
                            print("tap on: \(item.label)")
                            self.selectedNavBarTab = item
                        },
                        onLongTap: { item in
                            print("longTap on: \(item.label)")
                            self.selectedNavBarTab = item
                        }
                )
        )
    }

}
