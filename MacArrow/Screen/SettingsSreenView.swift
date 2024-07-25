import SwiftUI
import LaunchAtLogin
import Defaults

extension Defaults.Keys {
    static let isScrollDirectionEnabled = Key<Bool>("isScrollDirectionEnabled", default: true)
    static let isSmoothScrollingEnabled = Key<Bool>("isSmoothScrollingEnabled", default: true)
}

struct SettingsSreenView: View {
    @Default(.isScrollDirectionEnabled) var isScrollDirectionEnabled
    @Default(.isSmoothScrollingEnabled) var isSmoothScrollingEnabled
    //    @State private var isScrollDirectionEnabled: Bool = false
    //    @State private var isSmoothScrollingEnabled: Bool = false
   
    
    var body: some View {
        Form {
            Section {
                LaunchAtLogin.Toggle("登录启动")
                    .toggleStyle(SwitchToggleStyle())
                
                Toggle("反转方向", isOn: $isScrollDirectionEnabled)
                    .toggleStyle(SwitchToggleStyle())
                
                Toggle("顺滑滚动", isOn: $isSmoothScrollingEnabled)
                    .toggleStyle(SwitchToggleStyle())
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}
