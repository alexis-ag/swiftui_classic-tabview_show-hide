import SwiftUI

struct SafeAreaEdgeInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        let keyWindows = UIApplication.shared.windows.filter { $0.isKeyWindow }.first ??
                UIApplication.shared.windows[0]

        return keyWindows.safeAreaEdgeInsets
    }
}

extension EnvironmentValues {
    ///Should only be used once UIApplication is instantiated by the system
    var safeAreaEdgeInsets: EdgeInsets {
        self[SafeAreaEdgeInsetsKey.self]
    }
}

extension UIEdgeInsets {
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}

extension UIWindow {
    var safeAreaEdgeInsets: EdgeInsets {
        safeAreaInsets.insets
    }
}