// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomNSViewFirstResponder",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "CustomNSViewFirstResponder", targets: ["CustomNSViewFirstResponder"]),
    ],
    targets: [
        .target(name: "CustomNSViewFirstResponder", dependencies: []),
    ]
)
