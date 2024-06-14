// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TimeryWidget",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TimeryWidget",
            targets: ["TimeryWidget"])
    ],
    dependencies: [
        // Add dependencies here
    ],
    targets: [
        .target(
            name: "TimeryWidget",
            dependencies: []
        )
    ]
)
