import SwiftUI

struct DashboardContainer: View {
    let  props: Props
    @Environment(\.tabBarHeight) private var tabBarHeight

    var body: some View {
        NavigationView {
            DashboardView(props: .init())
                    .navigationTitle("Dashboard")
        }
            //note! if you put this modifier on NavView
            //it applies menu to the all nav hierarchy
            .bottomNav(enabled: .constant(true))
    }
}
