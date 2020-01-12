
import Combine
import AppKit
import SwiftUI

struct Sample1: View {
    var input = (text: "Initial value", time: Date())
    var output = { _ in } as (String) -> Void
    var body: some View {
        VStack {
            Sample2(input: input.text, output: output)
            Divider()
            Text("\(input.time)")
            Divider()
            Text("\(input.time.timeIntervalSince1970)")
            Divider()
            Text("\(input.text.count) characters")
        }
    }
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
let host = NSHostingView(rootView: Sample1())
win.setIsVisible(true)
win.setContentSize(NSSize(width: 256, height: 256))
win.center()
win.contentView = host
func step(_ newValue:String) {
    let newInput = (newValue,Date())
    host.rootView = Sample1(input: newInput, output: step)
}
host.rootView = Sample1(input: ("Second value.",Date()), output: step)

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.run()
