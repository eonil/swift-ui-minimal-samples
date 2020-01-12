
import Combine
import AppKit
import SwiftUI

struct Sample1: View {
    var isFirstResponder: Bool
    var body: some View { Sample2(isFirstResponder: isFirstResponder) }
}
struct Sample2: NSViewRepresentable {
    var isFirstResponder: Bool
    func makeNSView(context: NSViewRepresentableContext<Sample2>) -> NSTextField {
        return NSTextField()
    }
    func updateNSView(_ x: NSTextField, context: NSViewRepresentableContext<Sample2>) {
        guard let win = x.window else { return }
        if isFirstResponder {
            if !containsFirstResponder(x) {
                win.makeFirstResponder(x)
            }
        }
        else {
            win.makeFirstResponder(win)
        }
    }
}

func containsFirstResponder(_ v:NSView) -> Bool {
    guard let win = v.window else { return false }
    guard let frv = win.firstResponder as? NSView else { return false }
    var x = frv as NSView?
    while x != nil {
        if x === v { return true }
        x = x?.superview
    }
    return false
}

let win = NSWindow()
let host = NSHostingView(rootView: Sample1(isFirstResponder: false))
win.setIsVisible(true)
win.setContentSize(NSSize(width: 256, height: 256))
win.center()
win.contentView = host
DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
    host.rootView = Sample1(isFirstResponder: true)
}
DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
    host.rootView = Sample1(isFirstResponder: false)
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.run()

