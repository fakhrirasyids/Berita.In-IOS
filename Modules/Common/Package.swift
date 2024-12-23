// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    defaultLocalization: "en",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Common",
            targets: ["Common"])
    ],
    targets: [
        .target(
            name: "Common",
            resources: [
                .process("NewsApi-Info.plist"),
                .process("Resources")
            ]
        )
    ]
)
