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
        .library(name: "AppboyUI", targets: ["AppboyUIUtils",  "AppboyInAppMessage", "AppboyContentCards", "AppboyNewsFeed"])
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
      .target(name: "AppboyUIUtils",
              path: "AppboyUI",
              sources: [
"ABKUIUtils/ABKUIUtils.m",
"ABKUIUtils/ABKUIURLUtils.m"
]
      ),
            .target(name: "AppboyContentCards",
              path: "AppboyUI",
              sources: [
"ABKContentCards/ViewControllers/Cells/ABKClassicImageContentCardCell.m",
"ABKContentCards/ViewControllers/Cells/ABKClassicContentCardCell.m",
"ABKContentCards/ViewControllers/Cells/ABKBaseContentCardCell.m",
"ABKContentCards/ViewControllers/Cells/ABKBannerContentCardCell.m",
"ABKContentCards/ViewControllers/Cells/ABKCaptionedImageContentCardCell.m",
"ABKContentCards/ViewControllers/ABKContentCardsTableViewController.m",
"ABKContentCards/ViewControllers/ABKContentCardsWebViewController.m",
"ABKContentCards/ViewControllers/ABKContentCardsViewController.m"
],
resources: [.process("ABKContentCards/Resources")       
           ]
      ),
            .target(name: "AppboyNewsFeed",
              path: "AppboyUI",
              sources: [
"ABKNewsFeed/ViewControllers/Cells/ABKNFClassicCardCell.m",
"ABKNewsFeed/ViewControllers/Cells/ABKNFBaseCardCell.m",
"ABKNewsFeed/ViewControllers/Cells/ABKNFBannerCardCell.m",
"ABKNewsFeed/ViewControllers/Cells/ABKNFCaptionedMessageCardCell.m",
"ABKNewsFeed/ViewControllers/ABKNewsFeedTableViewController.m",
"ABKNewsFeed/ViewControllers/ABKFeedWebViewController.m",
"ABKNewsFeed/ViewControllers/ABKNewsFeedViewController.m"
],
resources: [
           .process("ABKNewsFeed/Resources")
           ]
      ),
      
            .target(name: "AppboyInAppMessage",
              path: "AppboyUI",
              sources: [
"ABKInAppMessage/ABKInAppMessageWindow.m",
"ABKInAppMessage/ABKInAppMessageUIButton.m",
"ABKInAppMessage/ABKInAppMessageView.m",
"ABKInAppMessage/ABKInAppMessageUIController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageModalViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageSlideupViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageFullViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageImmersiveViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageWindowController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLFullViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLViewController.m",
"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLBaseViewController.m"
],
resources: [
           .process("ABKInAppMessage/Resources")
           ]
      )


    ]
)
