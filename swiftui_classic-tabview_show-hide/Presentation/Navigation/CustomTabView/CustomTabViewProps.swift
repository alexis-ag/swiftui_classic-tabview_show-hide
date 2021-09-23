import Foundation
import SwiftUI

extension CustomTabView {
    struct Props {
        let selectedNavBarTab: BottomNavTab
        let items: [BottomNavTabItem]
        let onTap: (BottomNavTab) -> Void
        let onLongTap: (BottomNavTab) -> Void
    }
}