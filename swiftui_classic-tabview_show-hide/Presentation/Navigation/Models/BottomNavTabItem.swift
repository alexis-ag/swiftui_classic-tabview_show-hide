import Foundation

struct BottomNavTabItem: Identifiable {
    var id: Int {  type.id }
    let type: BottomNavTab
    let notificationsCount: Int

    init(
            type: BottomNavTab,
            badge: Int = 0
    ) {
        self.type = type
        self.notificationsCount = badge
    }
}