// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "MarkdownUI": .staticLibrary,
        ],
    )
#endif

let package = Package(
    name: "Package",
    dependencies: [
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui", .upToNextMajor(from: "2.4.1")),
    ],
)
