import ProjectDescription

public struct Default {
    public static let team: String = "seonyeopkim"
    public static let deploymentTarget: DeploymentTargets = .iOS("26.0")
    
    public static func infoPlist() -> [String: Plist.Value] {
        [
            "UILaunchScreen": [
                "UIColorName": "",
                "UIImageName": "",
            ],
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait",
            ],
        ]
    }
    
    public static func settings() -> Settings {
        .settings(
            base: [
                "SWIFT_VERSION": "6.0",
            ]
        )
    }
}
