import SwiftUI

extension View {
    var hideTabViewBar: some View {
        modifier(HideTabViewBarModifier())
    }
}

struct HideTabViewBarModifier: ViewModifier {
    @Environment(\.safeAreaEdgeInsets) private var safeAreaEdgeInsets
    @Environment(\.tabBarHeight) private var tabBarHeight

    func body(content: Content) -> some View {
        content
                .padding(.bottom, -safeAreaEdgeInsets.bottom - tabBarHeight)
    }
}

