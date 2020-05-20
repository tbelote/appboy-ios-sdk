// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "AppboyKit",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "AppboyKit", targets: ["AppboyKit"]),
        .executable(name: "AppboyKitSDK", targets: ["AppboyKitSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    targets: [
        .systemLibrary(name: "AppboyKit", path: "AppboyKit"),
        .target(name: "AppboyKitSDK", path: "AppboyKit",
			sources: ["."],
			publicHeadersPath: "headers/AppboyKitLibrary",
			linkerSettings: [
				.linkedLibrary("z"),
				.linkedFramework("SystemConfiguration", .when(platforms: [.iOS])),
				.linkedFramework("QuartzCore", .when(platforms: [.iOS])),
				.linkedFramework("CoreText", .when(platforms: [.iOS])),
				.linkedFramework("WebKit", .when(platforms: [.iOS])),
			])
    ]
)
