// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomNSViewIO",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "CustomNSViewIO", targets: ["CustomNSViewIO"]),
    ],
    targets: [
        .target(name: "CustomNSViewIO", dependencies: []),
    ]
)
