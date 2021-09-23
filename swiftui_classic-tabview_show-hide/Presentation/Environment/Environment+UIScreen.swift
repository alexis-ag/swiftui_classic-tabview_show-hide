import SwiftUI

extension EnvironmentValues {
    var bounds: CGRect {
        self[MainScreenBoundsKey.self]
    }
    var mainScreen: UIScreen {
        self[UIScreenMainKey.self]
    }
}

struct MainScreenBoundsKey: EnvironmentKey {
    static var defaultValue: CGRect = UIScreen.main.bounds
}

struct UIScreenMainKey: EnvironmentKey {
    static var defaultValue: UIScreen = UIScreen.main
}

