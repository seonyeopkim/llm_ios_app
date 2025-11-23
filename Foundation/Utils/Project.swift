import ProjectDescription
import ProjectDescriptionHelpers

let name = "Utils"

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
        ),
    ],
)
