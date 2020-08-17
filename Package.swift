// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Appboy_iOS_SDK",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "Appboy_iOS_SDK", targets: ["Appboy_iOS_SDK"]),
        .library(name: "AppboyUI", path: ["AppboyUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
    ],
    targets: [
    	 .binaryTarget(
            name: "Appboy_iOS_SDK",
            url: "https://dl.dropboxusercontent.com/s/8xwq9h9mfdtyzad/Appboy_iOS_SDK.xcframework.zip?dl=1",
            checksum: "ac6c85562779660bd740109cfe522d4e93ea95f5b4130d1e61e6b81739d237c7"
            //Must be run from same folder as this file
            //swift package compute-checksum ~/Downloads/Appboy_iOS_SDK.framework.zip

       ),
       .target(name: "AppboyUI", sources: ["AppboyUI"])
    ]
)
