// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "Then": .framework,
            "SnapKit": .framework,
        ]
    )
#endif

let package = Package(
    name: "Timery",
    dependencies: [
        .package(path: "../../ViewExtension"),
        .package(path: "../../Home"),
        .package(path: "../../TestDetail"),
        .package(path: "../../DatabaseManager"),
        .package(path: "../../Entity"),
    ]
)
