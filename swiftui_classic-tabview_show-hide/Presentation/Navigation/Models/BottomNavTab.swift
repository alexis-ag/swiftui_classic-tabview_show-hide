import Foundation

enum BottomNavTab: Identifiable {
    case dashboard
    case contacts
    case events
    case messages
    case settings

    var id: Int {
        switch self {
        case .dashboard:
            return 0
        case .contacts:
            return 1
        case .events:
            return 2
        case .messages:
            return 3
        case .settings:
            return 4
        }
    }

    var label: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .contacts:
            return "Contacts"
        case .events:
            return "Events"
        case .messages:
            return "Messages"
        case .settings:
            return "Settings"
        }
    }

}