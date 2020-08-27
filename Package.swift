// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Appboy",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "Appboy_XCFramework", targets: ["Appboy_iOS_SDK"]),
        .library(name: "AppboyFullXCFramework", targets: ["AppboyFullSDK"])
//        .library(name: "AppboyUI", targets: ["AppboyUIUtils",  "AppboyInAppMessage", "AppboyContentCards", "AppboyNewsFeed"]),
        
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
            //swift package compute-checksum ~/Downloads/Appboy_iOS_SDK.xcframework.zip

       ),
       .binaryTarget(
            name: "AppboyFullSDK",
            url: "https://dl.dropboxusercontent.com/s/pps21gm5j1vccwj/AppboyFullSDK.xcframework.zip?dl=1",
            checksum: "7b0287fd4fa27a87f898a21639f892d67152b6c3b9e084e37707b2bf7d9db7cc"
       )
//      .target(name: "AppboyUIUtils",
//              dependencies: ["Appboy_iOS_SDK"],
//              path: "AppboyUI/ABKUIUtils",
//              sources: [
//								"ABKUIUtils.m",
//								"ABKUIURLUtils.m"
//							],
//							publicHeadersPath: "AppboyUI/ABKUIUtils"
//      ),
//            .target(name: "AppboyContentCards",
//              path: "AppboyUI/ABKContentCards",
//              sources: [
//								"ViewControllers/Cells/ABKClassicImageContentCardCell.m",
//								"ViewControllers/Cells/ABKClassicContentCardCell.m",
//								"ViewControllers/Cells/ABKBaseContentCardCell.m",
//								"ViewControllers/Cells/ABKBannerContentCardCell.m",
//								"ViewControllers/Cells/ABKCaptionedImageContentCardCell.m",
//								"ViewControllers/ABKContentCardsTableViewController.m",
//								"ViewControllers/ABKContentCardsWebViewController.m",
//								"ViewControllers/ABKContentCardsViewController.m"
//							],
//							resources: [
//							.process("Resources")
//												 ],
//							publicHeadersPath: "AppboyUI/ABKContentCards"           
//      ),
//            .target(name: "AppboyNewsFeed",
//              dependencies: ["SDWebImage"],
//              path: "AppboyUI/ABKNewsFeed",
//              sources: [
//								"ViewControllers/Cells/ABKNFClassicCardCell.m",
//								"ViewControllers/Cells/ABKNFBaseCardCell.m",
//								"ViewControllers/Cells/ABKNFBannerCardCell.m",
//								"ViewControllers/Cells/ABKNFCaptionedMessageCardCell.m",
//								"ViewControllers/ABKNewsFeedTableViewController.m",
//								"ViewControllers/ABKFeedWebViewController.m",
//								"ViewControllers/ABKNewsFeedViewController.m"
//							],
//							resources: [
//							.process("Resources")
//												 ],
//							publicHeadersPath: "AppboyUI/ABKNewsFeed"
//      ),
//      
//            .target(name: "AppboyInAppMessage",
//              path: "AppboyUI/ABKInAppMessage",
//              sources: [
//								"ABKInAppMessageWindow.m",
//								"ABKInAppMessageUIButton.m",
//								"ABKInAppMessageView.m",
//								"ABKInAppMessageUIController.m",
//								"ViewControllers/ABKInAppMessageViewController.m",
//								"ViewControllers/ABKInAppMessageModalViewController.m",
//								"ViewControllers/ABKInAppMessageSlideupViewController.m",
//								"ViewControllers/ABKInAppMessageFullViewController.m",
//								"ViewControllers/ABKInAppMessageImmersiveViewController.m",
//								"ViewControllers/ABKInAppMessageWindowController.m",
//								"ViewControllers/ABKInAppMessageHTMLFullViewController.m",
//								"ViewControllers/ABKInAppMessageHTMLViewController.m",
//								"ViewControllers/ABKInAppMessageHTMLBaseViewController.m"
//							],
//							resources: [
//							.process("Resources")
//												 ],
//							publicHeadersPath: "AppboyUI/ABKInAppMessage"
//           
//      )
//

    ]
)
