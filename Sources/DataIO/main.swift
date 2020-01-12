//
//  File.swift
//  
//
//  Created by Henry Hathaway on 1/13/20.
//

import Combine
import AppKit
import Combine
import SwiftUI

/// How to Implement Data Binding
/// -----------------------------
/// - `Sample1` conforms `ObservableObject`
/// - `Sample2.sample1` attributed with `@ObservedObject`.
/// - You can get `Binding<...>` object like `$sample1.field1`.
/// **Notice at the position of `$`**. You put `$` on `sample1`,
/// so Swift provides binding object automatically for all of its fields.
///
/// After that, now you can publish changes via `Sample1.$field1` using Combine publishers.
///
final class Sample1: ObservableObject {
    /// `@Published` is essential and required.
    /// Without it, data becomes read-only, and editing won't be applied.
    @Published var field1 = "Field 1 value..."
    @Published var field2 = "Field 2 value..."
}
struct Sample2: View {
    @ObservedObject var sample1: Sample1
    var body: some View {
        VStack {
            TextField("Field1", text: $sample1.field1)
            Divider()
            TextField("Field2", text: $sample1.field2)
        }
    }
}

let sample1 = Sample1()
let win = NSWindow()
let host = NSHostingView(rootView: Sample2(sample1: sample1))
var pipes = [AnyCancellable]()
win.setIsVisible(true)
win.setContentSize(NSSize(width: 256, height: 256))
win.center()
win.contentView = host
/// - Note:
///     Published event is fired **before** changed to be stored.
///     New value will be passed in as an argument.
sample1.$field1
    .sink(receiveValue: { newValue in print("\(sample1.field1) → \(newValue)" ) })
    .store(in: &pipes)

let app = NSApplication.shared
app.setActivationPolicy(.regular)
app.run()
