// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JimmyKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "JimmyKit",
            targets: ["JimmyKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/devxoul/Then", from: "3.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "JimmyKit",
            dependencies: [
                "Then",
                "SnapKit"
            ]
        ),
        .testTarget(
            name: "JimmyKitTests",
            dependencies: ["JimmyKit"]),
    ]
)
