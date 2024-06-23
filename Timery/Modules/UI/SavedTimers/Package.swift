// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SavedTimers",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SavedTimers",
            targets: ["SavedTimers"])
    ],
    dependencies: [
        .package(path: "../UIFusionKit")
    ],
    targets: [
        .target(
            name: "SavedTimers",
            dependencies: [
                "UIFusionKit"
            ]
        ),
        .testTarget(
            name: "SavedTimersTests",
            dependencies: ["SavedTimers"]
        ),
    ]
)
