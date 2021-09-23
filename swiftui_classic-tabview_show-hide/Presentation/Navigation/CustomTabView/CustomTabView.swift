import SwiftUI

struct CustomTabView: View {
    let props: Props
    @Environment(\.safeAreaEdgeInsets) private var safeAreaEdgeInsets

    var body: some View {
        VStack(spacing: 0) {
            Divider()
                    .padding(.bottom, Style.topDividerPadding)

            HStack(alignment: .bottom, spacing: 0) {
                ForEach(props.items) { item in
                    navItem(item: item, props: props)
                }
            }
        }
                .padding(.bottom, safeAreaEdgeInsets.bottom)
                .background(Style.bgColor)
    }


    @ViewBuilder
    private func navItem(item: BottomNavTabItem, props: Props) -> some View {
        let isSelected = item.type == props.selectedNavBarTab

        HStack(alignment: .bottom, spacing: 0) {
            Spacer()
            HStack(alignment: .bottom) {
                VStack(alignment: .center, spacing: 0) {
                    navIcon(
                            imgName: item.type.icon(isSelected: isSelected),
                            size: Style.Icon.size,
                            notificationsCount: item.notificationsCount,
                            fgColor: isSelected ? Style.Icon.accentColor : Style.Icon.color
                    )
                    Text(item.type.label)
                            .font(Style.Label.font)
                            .fixedSize(horizontal: true, vertical: true)
                            .foregroundColor(isSelected ? Style.Label.accentColor : Style.Label.color)
                            .padding(.bottom, Style.Label.paddingBottom)
                            .padding(.top, Style.Label.paddingTop)
                }
            }
            Spacer()
        }
                .contentShape(Rectangle())
                .onTapGesture(perform: { props.onTap(item.type) })
                .onLongPressGesture(perform: { props.onLongTap(item.type) })
    }


    @ViewBuilder
    private func navIcon(
            imgName: String,
            size: CGFloat,
            notificationsCount: Int,
            bgColor: Color = Color.clear,
            fgColor: Color = Color.accentColor
    ) -> some View {
        let title = notificationsCount > 999 ? "\(notificationsCount / 1000)k+" : "\(notificationsCount)"
        let isOneSymbol = notificationsCount < 10
        ZStack(alignment: .top) {
            CircleIcon(
                    props: .init(
                            size: size,
                            style: .systemImage(
                                    systemImageName:  imgName,
                                    font: Style.Icon.font,
                                    backgroundColor: bgColor,
                                    foregroundColor: fgColor
                            )
                    )
            )
            if notificationsCount <= 0 {
                EmptyView()
            } else if isOneSymbol {
                Text(title)
                        .font(Style.Badge.font)
                        .foregroundColor(Style.Badge.fgColor)
                        .padding(.horizontal, Style.Badge.paddingHorizontal)
                        .background(Style.Badge.bgColor)
                        .clipShape(Circle())
                        .offset(Style.Badge.offset)
                        .transition(.opacity)
            } else {
                Text(title)
                        .font(Style.Badge.font)
                        .foregroundColor(.white)
                        .padding(.horizontal, Style.Badge.paddingHorizontal)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .offset(Style.Badge.offset)
                        .transition(.opacity)
            }
        }
    }
}
