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
        //.library(name: "Appboy_iOS_SDK", targets: ["Appboy_iOS_SDK"]),
        .library(name: "Appboy_iOS_SDK", targets: ["Appboy_iOS_SDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
    ],
    targets: [
    	 .binaryTarget(
            name: "Appboy_iOS_SDK",
            url: "https://dl.dropboxusercontent.com/s/n8xqksl26igezf6/Appboy_iOS_SDK.framework.zip?dl=1",
            checksum: "da6ecb4b057940a357c71845cfe40e1f2f5e62b540973018df5a78e762a93c25"
            //Must be run from same folder as this file
            //swift package compute-checksum ~/Downloads/Appboy_iOS_SDK.framework.zip

       ),
//      .binaryTarget(
//            name: "Appboy_iOS_SDK",
//            url: "https://github.com/Appboy/appboy-ios-sdk/releases/download/3.27.0-beta1/Appboy_iOS_SDK_core.framework.zip",
//            checksum: "a4d12d16684d423d008e3c86e05d8db044bc5d65d374ff0632ea2636fd9146d5"
//            //Must be run from same folder as this file
//            //swift package compute-checksum ~/Downloads/Appboy_iOS_SDK_core.framework.zip
//      )

    ]
)
