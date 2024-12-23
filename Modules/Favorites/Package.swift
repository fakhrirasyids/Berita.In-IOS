// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Favorites",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Favorites",
            targets: ["Favorites"])
    ],
    dependencies: [
      // Dependencies declare other packages that this package depends on.
      // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1"),
      .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.8.0"),
      .package(url: "https://github.com/fakhrirasyids/berita.in-core-module-ios", from: "1.0.0"),
      .package(path: "../Common")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Favorites",
            dependencies: [
              "Swinject",
              "RxSwift",
              .product(name: "BeritaInCore", package: "berita.in-core-module-ios"),
              "Common"
            ])

    ]
)
