// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SampleCore",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SampleCore",
            targets: ["SampleCore"])
    ],
    dependencies: [
        // Add dependencies here
    ],
    targets: [
        .target(
            name: "SampleCore",
            dependencies: []
        )
    ]
)
