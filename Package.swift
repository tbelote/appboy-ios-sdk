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
        .library(name: "AppboyKit-core", targets: ["AppboyKit-core"]),
        //.library(name: "AppboyKit", targets: ["AppboyKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
    ],
    targets: [
//    	.binaryTarget(
//            name: "AppboyKit",
//            url: "https://github.com/Appboy/appboy-ios-sdk/releases/download/3.27.0-beta1/Appboy_iOS_SDK.framework.zip",
//            checksum: ""
//      ),
      .binaryTarget(
            name: "AppboyKit-core",
            url: "https://github.com/Appboy/appboy-ios-sdk/releases/download/3.27.0-beta1/Appboy_iOS_SDK_core.framework.zip",
            checksum: "a4d12d16684d423d008e3c86e05d8db044bc5d65d374ff0632ea2636fd9146d5"
            //Must be run from same folder as this file
            //swift package compute-checksum ~/Downloads/Appboy_iOS_SDK_core.framework.zip
      )

    ]
)
