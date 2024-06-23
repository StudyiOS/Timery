// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "UIExtension",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "UIExtension",
            targets: ["UIExtension"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.2.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.7.1"),
        .package(url: "https://github.com/devxoul/Then", from: "3.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
    ],
    targets: [
        .target(
            name: "UIExtension",
            dependencies: [
                "ReactorKit",
                "RxSwift",
                "Then",
                "SnapKit",
                .product(name: "RxRelay", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "UIExtensionTests",
            dependencies: ["UIExtension"]
        ),
    ]
)
