import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "general"
    
    var body: some View {
        NavigationView {
            Sidebar(selection: $selection)
            SettingsSreenView() // 默认显示的视图tablecells
        }
    }
}

struct Sidebar: View {
    @Binding var selection: String?
    
    var body: some View {
        List {
            NavigationLink(
                destination: SettingsSreenView(),
                tag: "general",
                selection: $selection
            ) {
                Label("通用", systemImage: "gearshape")
            }
            NavigationLink(
                destination: AboutScreenView(),
                tag: "about",
                selection: $selection
            ) {
                Label("关于", systemImage: "info.circle")
            }
        }
        .listStyle(SidebarListStyle())
    }
}
