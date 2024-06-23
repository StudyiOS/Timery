// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Reports",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Reports",
            targets: ["Reports"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.2.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.7.1"),
        .package(path: "../UIExtension")
    ],
    targets: [
        .target(
            name: "Reports",
            dependencies: [
                "UIExtension",
                "RxSwift",
                "ReactorKit"
            ]
        ),
        .testTarget(
            name: "ReportsTests",
            dependencies: ["Reports"]
        ),
    ]
)
