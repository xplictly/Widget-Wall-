import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Status bar item
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem?.button {
            button.title = "WW"
        }

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Show Sample Widget", action: #selector(showWidget), keyEquivalent: "s"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem?.menu = menu

        // Create a simple widget window (hidden by default)
        let rect = NSRect(x: 200, y: 200, width: 320, height: 200)
        window = NSWindow(contentRect: rect,
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered,
                          defer: false)
        window?.title = "Sample Widget"

        // Content
        let label = NSTextField(labelWithString: "Hello from WidgetWall Swift Prototype")
        label.font = NSFont.systemFont(ofSize: 16, weight: .semibold)
        label.alignment = .center
        label.frame = NSRect(x: 10, y: 80, width: 300, height: 40)
        window?.contentView?.addSubview(label)

        window?.orderOut(nil)
    }

    @objc func showWidget() {
        guard let w = window else { return }
        w.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}

let delegate = AppDelegate()
NSApplication.shared.delegate = delegate
NSApplication.shared.setActivationPolicy(.regular)
NSApplication.shared.run()
