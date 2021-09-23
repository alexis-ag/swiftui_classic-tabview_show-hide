import SwiftUI

struct DashboardContainer: View {
    let  props: Props

    var body: some View {
        NavigationView {
            pageContent()
                    .navigationTitle("Dashboard")
        }
    }

    @ViewBuilder
    private func pageContent() -> some View {
        VStack {
            Text("Dashboard container")
            NavigationLink(destination: Text("Details")) {
                Text("Details")
            }
        }
    }
}
