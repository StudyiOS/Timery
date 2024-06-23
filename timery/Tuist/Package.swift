// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "Timery",
    dependencies: [
        .package(path: .baseModulePath + "UI/Home"),
        .package(path: .baseModulePath + "UI/Reports"),
        .package(path: .baseModulePath + "UI/TimeEntries"),
        .package(path: .baseModulePath + "UI/SavedTimers"),
        .package(path: .baseModulePath + "UI/Settings"),
        .package(path: .baseModulePath + "UI/UIExtension"),
        .package(path: .baseModulePath + "UI/TestDetail"),
//        .package(path: .baseModulePath + "Domain/MyDomainModule"),
        .package(path: .baseModulePath + "Core/Entity"),
        .package(path: .baseModulePath + "Core/DatabaseManager"),
    ]
)

extension String {
    static var baseModulePath: Self {
        return "../Modules/"
    }
}
