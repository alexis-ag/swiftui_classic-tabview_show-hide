import SwiftUI

extension View {
    func hideTabViewBar(_ tabBarHeight: Binding<CGFloat>) -> some View {
        modifier(HideTabViewBarModifier(tabBarHeight: tabBarHeight))
    }
}

struct HideTabViewBarModifier: ViewModifier {
    @Binding var tabBarHeight: CGFloat
    @Environment(\.safeAreaEdgeInsets) private var safeAreaEdgeInsets

    func body(content: Content) -> some View {
        content
                .padding(.bottom, -safeAreaEdgeInsets.bottom - tabBarHeight)
    }
}

