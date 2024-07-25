import SwiftUI
import LaunchAtLogin
import Defaults

extension Defaults.Keys {
    static let isScrollDirectionEnabled = Key<Bool>("isScrollDirectionEnabled", default: true)
    static let isSmoothScrollingEnabled = Key<Bool>("isSmoothScrollingEnabled", default: true)
    static let isShiftHorizontalScrollEnabled = Key<Bool>("isShiftHorizontalScrollEnabled", default: true)
}

struct SettingsSreenView: View {
    @Default(.isScrollDirectionEnabled) var isScrollDirectionEnabled
    @Default(.isSmoothScrollingEnabled) var isSmoothScrollingEnabled
    @Default(.isShiftHorizontalScrollEnabled) var isShiftHorizontalScrollEnabled
   
    
    var body: some View {
        Form {
            Section {
                LaunchAtLogin.Toggle("登录启动")
                    .toggleStyle(SwitchToggleStyle())
                
                Toggle("反转方向", isOn: $isScrollDirectionEnabled)
                    .toggleStyle(SwitchToggleStyle())
                
                Toggle("顺滑滚动", isOn: $isSmoothScrollingEnabled)
                    .toggleStyle(SwitchToggleStyle())
                
                Toggle("按住Shift横向滚动", isOn: $isShiftHorizontalScrollEnabled)
                    .toggleStyle(SwitchToggleStyle())
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}
