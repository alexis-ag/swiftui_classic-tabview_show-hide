import SwiftUI

struct DashboardView: View {
    let props: Props
    @Environment(\.tabBarHeight) private var tabBarHeight


    var body: some View {
        VStack {
            Text("Dashboard container : \(tabBarHeight)")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
        }
    }
}