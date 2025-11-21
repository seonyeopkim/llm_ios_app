import ProjectDescription
import ProjectDescriptionHelpers

let name = "ChatFeature"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .staticLibrary,
            internalDependencies: [
                .Interface,
            ],
            externalDependencies: [
                .project(
                    target: "DesignSystem",
                    path: .relativeToRoot("Core/DesignSystem"),
                ),
                .project(
                    target: "LanguageModelClientInterface",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
        ),
        .interface(
            name: name,
            product: .staticLibrary,
        ),
        .example(
            name: name,
            internalDependencies: [
                .Source,
            ],
            externalDependencies: [
                // TODO: Create Testing target and Remove the dependency below
                .project(
                    target: "LanguageModelClient",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
        ),
    ],
)
