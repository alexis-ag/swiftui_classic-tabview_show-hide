import SwiftUI

extension EnvironmentValues {
    ///TabView raw height; does not include bottom safe area.
    var tabBarHeight: CGFloat {
        get { self[TabBarHeightEnvironmentKey.self] }
        set { self[TabBarHeightEnvironmentKey.self] = newValue }
    }
}

struct TabBarHeightEnvironmentKey: EnvironmentKey {
    static var defaultValue: CGFloat = 0
}



extension View {
    /// Read TabView height from underlying  UITabBarController  and keep it in property passed by binding.
    ///
    /// # Usage
    /// ```
    /// @State private var tabViewHeight: CGFloat = 0
    /// TabItem().keepTabViewHeight(in: $tabViewHeight)
    /// ```
    func keepTabViewHeight(
            in storage: Binding<CGFloat>,
            includingSeparator tabViewHeightShouldIncludeSeparator: Bool = true
    ) -> some View {
        background(TabBarAccessor { tabBar in
            let onePixel: CGFloat = 1/3
            let separatorHeight: CGFloat = tabViewHeightShouldIncludeSeparator ? onePixel : 0
            DispatchQueue.main.async {
                storage.wrappedValue = tabBar.bounds.height + separatorHeight
            }
        })
    }
}

// Helper bridge to UIViewController to access enclosing UITabBarController
// and thus its UITabBar
struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) ->
            UIViewController {
        proxyController.callback = callback
        return proxyController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TabBarAccessor>) {
    }

    typealias UIViewControllerType = UIViewController

    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = self.tabBarController {
                self.callback(tabBar.tabBar)
            }
        }
    }
}
