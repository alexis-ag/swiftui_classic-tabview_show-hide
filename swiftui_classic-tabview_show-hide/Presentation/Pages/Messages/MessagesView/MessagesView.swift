import SwiftUI

struct MessagesView: View {
    let props: Props

    var body: some View {
        List {
            Section(header: owner) {
                ForEach((1...props.fakeMsgsCount), id: \.self) {
                    message($0)
                }
            }
        }
                .listStyle(PlainListStyle())
    }

    private var owner: some View {
        Text(props.ownerName)
                .clipShape(Capsule(style: .continuous))
                .frame(height: Style.ownerHeight)
    }

    private func message(_ index: Int) -> some View {
        NavigationLink(destination: Text("Details for message: \(index)")) {
            VStack(alignment: .leading) {
                Text("message \(index) ")
                Text("timestamp: \(Date().timeIntervalSince1970)")
            }
        }
    }
}