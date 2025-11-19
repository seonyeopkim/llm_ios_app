import ProjectDescription

let project = Project(
    name: "Entities",
    targets: [
        .target(
            name: "Entities",
            destinations: .iOS,
            product: .framework,
            bundleId: "seonyeopkim.Foundation.Entities",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .default,
            buildableFolders: [
                "Source",
            ],
            dependencies: []
        ),
        .target(
            name: "EntitiesTesting",
            destinations: .iOS,
            product: .framework,
            bundleId: "seonyeopkim.Foundation.Entities.Testing",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .default,
            buildableFolders: [
                "Testing",
            ],
            dependencies: [
                .target(name: "Entities"),
            ]
        ),
    ]
)
