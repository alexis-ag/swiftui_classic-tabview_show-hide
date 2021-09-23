import SwiftUI

struct DashboardView: View {
    let props: Props

    var body: some View {
        VStack {
            Text("Dashboard container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
        }
    }
}