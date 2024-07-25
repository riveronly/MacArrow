import Cocoa

class MouseEventController {
    var eventTap: CFMachPort?

    init() {
        setupEventTap()
    }

    func setupEventTap() {
        let eventMask = CGEventMask(1 << CGEventType.scrollWheel.rawValue)

        eventTap = CGEvent.tapCreate(tap: .cgSessionEventTap,
                                     place: .headInsertEventTap,
                                     options: .defaultTap,
                                     eventsOfInterest: eventMask,
                                     callback: eventCallback,
                                     userInfo: nil)

        if let eventTap = eventTap {
            let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
            CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: eventTap, enable: true)
        } else {
            print("Failed to create event tap")
        }
    }

    let eventCallback: CGEventTapCallBack = { (proxy, type, event, refcon) in
        if type == .scrollWheel {
            let scrollY = event.getDoubleValueField(.scrollWheelEventDeltaAxis1)
            print("Scroll event detected: \(scrollY)")
        }
        return Unmanaged.passRetained(event)
    }
}
