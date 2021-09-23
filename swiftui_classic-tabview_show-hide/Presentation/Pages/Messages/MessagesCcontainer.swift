import SwiftUI

struct MessagesContainer: View {
    let props: Props

    @State private var scrollTo: Int? = nil
    @State private var selectedTab = 0
    @State private var scrollProxy: ScrollViewProxy? = nil

    var body: some View {
        NavigationView {
            pageContent()
                    .navigationTitle("Messages")
        }
    }

    @ViewBuilder
    private func pageContent() -> some View {
        ScrollViewReader { sp in
            setScrollViewProxy(scrollViewProxy: sp)
            List {
                owner().id("header")
                Section(header:  tabs()) {
                    itemsContent()
                }.id("content")
            }
                    .padding(0)
                    .listStyle(PlainListStyle())
        }
    }

    private func setScrollViewProxy(scrollViewProxy: ScrollViewProxy) -> some View {
        DispatchQueue.main.async {
            self.scrollProxy = scrollViewProxy
        }
        return EmptyView()
    }

    private func itemsContent() -> some View {
        TabView(selection: $selectedTab) {
            contacts()
                    .onPreferenceChange(OffsetKey.self, perform: onPrefChange)
                    .tag(0)

            employees()
                    .tag(1)

            clients()
                    .tag(2)
        }
                .frame(height: 550 )
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }

    private func contacts() -> some View {
        GeometryReader { g in
            List {
                contactItems()
                        .anchorPreference(key: OffsetKey.self, value: .top) {
                            g[$0].y
                        }
                        .transition(.identity)
            }
        }
    }


    private func contactItems() -> some View {
        ForEach((1...100), id: \.self) { id in
            message(id)
        }
    }

    private func employees() -> some View {
        List {
            ForEach((1...100), id: \.self) {
                message($0)
            }
        }
    }

    private func clients() -> some View {
        List {
            ForEach((1...100), id: \.self) {
                message($0)
            }
        }
    }

    private func owner() -> some View {
        Text("My owner name").clipShape(Capsule(style: .continuous))
                .frame(height: 50)
    }

    private func tabs() -> some View {
        Picker(selection: $selectedTab, label: EmptyView()) {
            Text("Contacts").tag(0)
            Text("Employees").tag(1)
            Text("Clients").tag(2)
        }
                .pickerStyle(SegmentedPickerStyle())
    }

    private func message(_ index: Int) -> some View {
        NavigationLink(destination: Text("Details for message: \(index)")) {
            VStack(alignment: .leading) {
                Text("message \(index) ")
                Text("timestamp: \(Date().timeIntervalSince1970)")
            }
        }
    }

    private func onPrefChange(_ pref: CGFloat) {
        guard pref != 0 && abs(pref) != .infinity else {
            return
        }

        print(pref)
        var id = 0
        if pref == -233 {
            id = 1
        }

        if pref < 500 {
            id = 100
        }

        withAnimation {
            scrollProxy?.scrollTo("id-\(id)")
        }
    }
}