import ProjectDescription
import ProjectDescriptionHelpers

let name = "Main"

let project = Project(
    name: name,
    targets: [
        .target(
            name: name,
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "\(Default.team).\(name)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .extendingDefault(with: Default.infoPlist()),
            buildableFolders: [
                "Source",
            ],
            dependencies: [
                .project(
                    target: "ChatFeature",
                    path: .relativeToRoot("Feature/ChatFeature"),
                ),
                .project(
                    target: "LanguageModelClient",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
            settings: Default.settings(),
        ),
    ],
)
