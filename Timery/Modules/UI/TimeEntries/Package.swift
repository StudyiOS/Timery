// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TimeEntries",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TimeEntries",
            targets: ["TimeEntries"])
    ],
    dependencies: [
        .package(path: "../UIFusionKit")
    ],
    targets: [
        .target(
            name: "TimeEntries",
            dependencies: [
                "UIFusionKit"
            ]
        ),
        .testTarget(
            name: "TimeEntriesTests",
            dependencies: ["TimeEntries"]
        ),
    ]
)
