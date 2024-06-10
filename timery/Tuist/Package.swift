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
        .package(path: "Timery/Modules/UI/ViewExtension"),
        .package(path: "Timery/Modules/UI/Home"),
        .package(path: "Timery/Modules/UI/TestDetail"),
    ]
)
