import ProjectDescription


let baseSettings: [String: SettingValue] = [
    "MARKETING_VERSION": "1.0.0",
    "CURRENT_PROJECT_VERSION": "1.0.0.0"
]

let infoPlist: [String : Plist.Value] = [
    "CFBundleDisplayName": "Timery",
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1.0.0.0",
    "UILaunchStoryboardName": "LaunchScreen.storyboard",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ]
            ]
        ]
    ],
]

let deploymentTarget: DeploymentTargets = .iOS("17.0")


let project = Project(
    name: "Timery",
    packages: [
        .local(path: .relativeToRoot("../ViewExtension")),
        .local(path: .relativeToRoot("../Home")),
    ],
    targets: [
        .target(
            name: "Timery",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Timery",
            deploymentTargets: deploymentTarget,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Timery/Sources/**"],
            resources: ["Timery/Resources/**"],
            dependencies: [
                .package(product: "ViewExtension"),
                .package(product: "Home"),
            ]
        ),
        .target(
            name: "TimeryTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TimeryTests",
            infoPlist: .default,
            sources: ["Timery/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Timery")]
        ),
    ]
)

