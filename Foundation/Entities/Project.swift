import ProjectDescription
import ProjectDescriptionHelpers

let name = "Entities"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
        ),
        .testing(
            name: name,
            product: .framework,
            internalDependencies: [
                .Source
            ]
        ),
    ]
)
