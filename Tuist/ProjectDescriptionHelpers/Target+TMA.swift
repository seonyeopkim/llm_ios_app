import ProjectDescription

public extension Target {
    static func source(name: String, product: Product, internalDependencies: [TMATarget] = [], externalDependencies: [TargetDependency] = []) -> Target {
        .target(
            name: name,
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                "Source",
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func interface(name: String, product: Product) -> Target {
        .target(
            name: "\(name)Interface",
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)Interface",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                "Interface",
            ],
            dependencies: [],
            settings: Default.settings(),
        )
    }
    
    static func tests(name: String, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        .target(
            name: "\(name)Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(Default.team).\(name)Tests",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                "Tests",
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func testing(name: String, product: Product, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        .target(
            name: "\(name)Testing",
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)Testing",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                "Testing",
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func example(name: String, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        .target(
            name: "\(name)Example",
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "\(Default.team).\(name)Example",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .extendingDefault(with: Default.infoPlist()),
            buildableFolders: [
                "Example",
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
}

public enum TMATarget: String {
    case Source
    case Interface
    case Tests
    case Testing
    case Example
    
    var suffix: String {
        switch self {
        case .Source: ""
        default: self.rawValue
        }
    }
}

private extension [TMATarget] {
    func converted(with name: String) -> [TargetDependency] {
        self.map { .target(name: "\(name)\($0.suffix)") }
    }
}
