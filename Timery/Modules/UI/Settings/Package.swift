// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Settings",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Settings",
            targets: ["Settings"])
    ],
    dependencies: [
        .package(path: "../UIFusionKit")
    ],
    targets: [
        .target(
            name: "Settings",
            dependencies: [
                "UIFusionKit"
            ]
        ),
        .testTarget(
            name: "SettingsTests",
            dependencies: ["Settings"]
        ),
    ]
)
