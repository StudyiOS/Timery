// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SampleUIModule",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SampleUIModule",
            targets: ["SampleUIModule"])
    ],
    dependencies: [
        .package(path: "../ViewExtension")
    ],
    targets: [
        .target(
            name: "SampleUIModule",
            dependencies: [
                "ViewExtension"
            ]
        ),
        .testTarget(
            name: "SampleUIModule" + "Tests",
            dependencies: ["SampleUIModule"]
        ),
    ]
)
