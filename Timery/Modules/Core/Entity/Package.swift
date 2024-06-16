// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Entity",
    products: [
        .library(
            name: "Entity",
            targets: ["Entity"]),
    ],
    targets: [
        .target(
            name: "Entity"),
    ]
)
