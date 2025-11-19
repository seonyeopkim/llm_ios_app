import ProjectDescription

let project = Project(
    name: "Main",
    targets: [
        .target(
            name: "Main",
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "seonyeopkim.App.Main",
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
                "Source",
            ],
            dependencies: [
                .project(
                    target: "ChatFeature",
                    path: .relativeToRoot("Feature/ChatFeature"),
                ),
            ]
        ),
    ]
)
