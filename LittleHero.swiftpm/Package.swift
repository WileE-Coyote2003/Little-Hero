// swift-tools-version: 6.0

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Little Hero",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        .iOSApplication(
            name: "Little Hero",
            targets: ["AppModule"],
            bundleIdentifier: "com.thwinhtooaung.Little-Hero",
            teamIdentifier: "54Z95V4KYX",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .asset("AccentColor"),
            supportedDeviceFamilies: [
                .pad
            ],
            supportedInterfaceOrientations: [
                .landscapeLeft,
                .landscapeRight
            ],
            additionalInfoPlistContentFilePath: "SupportingInfo.plist"
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "Sources/AppModule"
        )
    ],
    swiftLanguageModes: [.v5]
)
