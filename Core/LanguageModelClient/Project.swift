import ProjectDescription
import ProjectDescriptionHelpers

let name = "LanguageModelClient"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
            internalDependencies: [
                .Interface,
            ],
        ),
        .interface(
            name: name,
            product: .framework,
        ),
        .testing(
            name: name,
            product: .framework,
            internalDependencies: [
                .Interface,
            ],
            externalDependencies: [
                .project(
                    target: "Utils",
                    path: .relativeToRoot("Foundation/Utils"),
                ),
            ],
        ),
    ],
)
