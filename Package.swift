// swift-tools-version:5.3

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
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0")
    ],
    targets: [
	 .binaryTarget(
            name: "AppboyKit",
            url: "https://github.com/Appboy/appboy-ios-sdk/releases/download/3.23.0/Appboy_iOS_SDK.framework.zip",
            checksum: "99af66310857000d0acce73e3729136afcf88135e9ce6e0beee773a402c81e96"
        )
    ]
)
