
import AppKit
import SwiftUI

struct Sample1: NSViewRepresentable {
    /// Just share the reference directly
    /// to avoid infinite loop issue with SwiftUI.
    var textField: NSTextField
    func makeNSView(context:NSViewRepresentableContext<Sample1>) -> NSView { textField }
    func updateNSView(_ x:NSView, context:NSViewRepresentableContext<Sample1>) {}
}

let win = NSWindow()
let txt = NSTextField()
win.setIsVisible(true)
win.setContentSize(NSSize(width: 256, height: 256))
win.center()
win.contentView = NSHostingView(rootView: Sample1(textField: txt))
win.makeFirstResponder(txt)

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.run()
