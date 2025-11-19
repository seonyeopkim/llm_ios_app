import ProjectDescription

let project = Project(
    name: "DesignSystem",
    targets: [
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .framework,
            bundleId: "seonyeopkim.Core.DesignSystem",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .default,
            buildableFolders: [
                "Source",
            ],
            dependencies: [
                .project(
                    target: "Entities",
                    path: .relativeToRoot("Foundation/Entities"),
                ),
            ]
        ),
        .target(
            name: "DesignSystemExample",
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "seonyeopkim.Core.DesignSystem.Example",
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
                .target(name: "DesignSystem"),
                .project(
                    target: "EntitiesTesting",
                    path: .relativeToRoot("Foundation/Entities"),
                ),
            ]
        ),
    ]
)
