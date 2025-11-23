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
        .tests(
            name: name,
            internalDependencies: [
                .Source,
                .Testing,
            ],
            externalDependencies: [
                .project(
                    target: "LanguageModelClientTesting",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
        ),
        .testing(
            name: name,
            product: .staticLibrary,
            internalDependencies: [
                .Interface,
            ],
            externalDependencies: [
                .project(
                    target: "LanguageModelClientInterface",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
        ),
        .example(
            name: name,
            internalDependencies: [
                .Source,
                .Testing,
            ],
            externalDependencies: [
                .project(
                    target: "LanguageModelClientTesting",
                    path: .relativeToRoot("Core/LanguageModelClient"),
                ),
            ],
        ),
    ],
)
