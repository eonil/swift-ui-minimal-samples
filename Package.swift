// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIMinimalSamples",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "CustomNSViewIO", targets: ["CustomNSViewIO"]),
        .executable(name: "CustomNSViewIOLoop", targets: ["CustomNSViewIOLoop"]),
        .executable(name: "CustomNSViewFirstResponder", targets: ["CustomNSViewFirstResponder"]),
    ],
    targets: [
        .target(name: "CustomNSViewIO", dependencies: []),
        .target(name: "CustomNSViewIOLoop", dependencies: []),
        .target(name: "CustomNSViewFirstResponder", dependencies: []),
    ]
)
