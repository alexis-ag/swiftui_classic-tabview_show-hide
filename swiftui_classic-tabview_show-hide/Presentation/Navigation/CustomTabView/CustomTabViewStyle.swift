import SwiftUI

extension CustomTabView {
    struct Style {

        static let bgColor = Color(r: 247, g: 247, b: 247, a: 0.94)
        static let topDividerPadding: CGFloat = 4

        struct Badge {
            static let offset = CGSize(width: 16, height: -2)
            static let bgColor = Color.red
            static let fgColor = Color.white
            static let font: Font = Font.system(size: 13)
            static let paddingHorizontal: CGFloat = 5
        }

        struct Icon {
            static let size: CGFloat = 28
            static let color = Color(r: 142, g: 142, b: 147, a: 1)
            static let accentColor = Color.accentColor
            static let font: Font = .title
        }

        struct Label {
            static let color = Color(r: 142, g: 142, b: 147, a: 1)
            static let accentColor = Color.accentColor
            static let font: Font = Font.system(size: 10)
            static let paddingBottom: CGFloat = 1
            static let paddingTop: CGFloat = 3
        }
    }
}