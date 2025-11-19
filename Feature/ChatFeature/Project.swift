import ProjectDescription

let project = Project(
    name: "ChatFeature",
    targets: [
        .target(
            name: "ChatFeature",
            destinations: .iOS,
            product: .staticLibrary,
            bundleId: "seonyeopkim.Feature.ChatFeature",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .default,
            buildableFolders: [
                "Source",
            ],
            dependencies: [
                .project(
                    target: "DesignSystem",
                    path: .relativeToRoot("Core/DesignSystem"),
                ),
                .project(
                    target: "EntitiesTesting",
                    path: .relativeToRoot("Foundation/Entities"),
                ),
            ]
        ),
        .target(
            name: "ChatFeatureExample",
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "seonyeopkim.Feature.ChatFeature.Example",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "UISupportedInterfaceOrientations": [
                        "UIInterfaceOrientationPortrait",
                    ],
                ]
            ),
            buildableFolders: [
                "Example",
            ],
            dependencies: [
                .target(name: "ChatFeature"),
            ]
        ),
    ]
)
