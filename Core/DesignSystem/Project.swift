import ProjectDescription
import ProjectDescriptionHelpers

let name = "DesignSystem"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
            externalDependencies: [
                .project(
                    target: "Entities",
                    path: .relativeToRoot("Foundation/Entities"),
                ),
                .external(name: "MarkdownUI"),
            ],
        ),
        .example(
            name: name,
            internalDependencies: [
                .Source,
            ],
            externalDependencies: [
                .project(
                    target: "EntitiesTesting",
                    path: .relativeToRoot("Foundation/Entities"),
                ),
            ],
        ),
    ],
)
