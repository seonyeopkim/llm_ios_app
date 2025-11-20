import ProjectDescription
import ProjectDescriptionHelpers

let name = "ChatFeature"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .staticLibrary,
            externalDependencies: [
                .project(
                    target: "DesignSystem",
                    path: .relativeToRoot("Core/DesignSystem"),
                ),
            ]
        ),
        .example(
            name: name,
            internalDependencies: [
                .Source,
            ]
        ),
    ]
)
