import SwiftUI
import MenuBarExtraAccess

@main
struct MacArrowApp: App {
    
    let AppWidth = 600.0, AppHeight = 400.0
    @State private var mainWindow: NSWindow? = nil
    var mouseEventController = MouseEventController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: AppWidth, minHeight: AppHeight)
                .onAppear {
                    if mainWindow == nil {
                        mainWindow = NSApplication.shared.windows.first
                    }
                }
        }
        .defaultSize(width: AppWidth, height: AppHeight)
        
        MenuBarExtra("Menu", systemImage: "swift") {
            Text("MacArrow")
            Button("偏好设置"){
                showMainWindow()
            }
            Button("退出"){
                NSApplication.shared.terminate(nil)
            }
        }
        .menuBarExtraStyle(.menu)
    }
    func showMainWindow() {
        mainWindow?.makeKeyAndOrderFront(nil)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
}
