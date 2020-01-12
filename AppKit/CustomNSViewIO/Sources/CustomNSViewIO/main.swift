
import Combine
import AppKit
import SwiftUI

struct Sample1: View {
    var input: String
    var output: (String) -> Void
    var body: some View { Sample2(input: input, output: output) }
}
struct Sample2: NSViewRepresentable {
    var input: String
    var output: (String) -> Void
    func makeNSView(context: NSViewRepresentableContext<Sample2>) -> PubTextView {
        let x = PubTextView()
        x.font = NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize*2, weight: .regular)
        return x
    }
    func updateNSView(_ x: PubTextView, context: NSViewRepresentableContext<Sample2>) {
        x.string = input
        x.onChange = output
    }
}
final class PubTextView: NSTextView {
    var onChange = { _ in } as (String) -> Void
    override func didChangeText() {
        super.didChangeText()
        onChange(string)
    }
}

let win = NSWindow()
win.setIsVisible(true)
win.setContentSize(NSSize(width: 256, height: 256))
win.center()
win.contentView = NSHostingView(rootView: Sample1(
    input: "Initial value.",
    output: { print($0) }))

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.run()
