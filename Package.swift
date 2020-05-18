// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "AppboyKit",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v8),
        .tvOS(.v9)
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    products: [
        .library(name: "AppboyKit", targets: ["AppboyKit"]),
    ],
    targets: [
        .systemLibrary(name: "AppboyKit", path: "AppboyKit"),
    ]
)
