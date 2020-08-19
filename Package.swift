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
              path: "AppboyUI/ABKUIUtils",
              sources: [
"ABKUIUtils.m",
"ABKUIURLUtils.m"
]
      ),
            .target(name: "AppboyContentCards",
              path: "AppboyUI/ABKContentCards",
              sources: [
"ViewControllers/Cells/ABKClassicImageContentCardCell.m",
"ViewControllers/Cells/ABKClassicContentCardCell.m",
"ViewControllers/Cells/ABKBaseContentCardCell.m",
"ViewControllers/Cells/ABKBannerContentCardCell.m",
"ViewControllers/Cells/ABKCaptionedImageContentCardCell.m",
"ViewControllers/ABKContentCardsTableViewController.m",
"ViewControllers/ABKContentCardsWebViewController.m",
"ViewControllers/ABKContentCardsViewController.m"
],
resources: [
.process("Resources/images/appboy_cc_icon_pinned.png"),
.process("Resources/images/appboy_cc_noimage_lrg.png"),
.process("Resources/images/appboy_cc_icon_pinned@2x.png"),
.process("Resources/images/appboy_cc_noimage_lrg@2x.png"),
.process("Resources/images/appboy_cc_icon_pinned@3x.png"),
.process("Resources")
           ]
      ),
            .target(name: "AppboyNewsFeed",
              path: "AppboyUI/ABKNewsFeed",
              sources: [
"ViewControllers/Cells/ABKNFClassicCardCell.m",
"ViewControllers/Cells/ABKNFBaseCardCell.m",
"ViewControllers/Cells/ABKNFBannerCardCell.m",
"ViewControllers/Cells/ABKNFCaptionedMessageCardCell.m",
"ViewControllers/ABKNewsFeedTableViewController.m",
"ViewControllers/ABKFeedWebViewController.m",
"ViewControllers/ABKNewsFeedViewController.m"
],
resources: [
.process("Resources/images/img-noimage-lrg.png"),
.process("Resources/images/img-noimage-lrg@2x.png"),
.process("Resources/images/Icons_Unread.png"),
.process("Resources/images/Icons_Read@2x.png"),
.process("Resources/images/Icons_Read.png"),
.process("Resources/images/Icons_Unread@2x.png"),
.process("Resources")
           ]
      ),
      
            .target(name: "AppboyInAppMessage",
              path: "AppboyUI/ABKInAppMessage",
              sources: [
"ABKInAppMessageWindow.m",
"ABKInAppMessageUIButton.m",
"ABKInAppMessageView.m",
"ABKInAppMessageUIController.m",
"ViewControllers/ABKInAppMessageViewController.m",
"ViewControllers/ABKInAppMessageModalViewController.m",
"ViewControllers/ABKInAppMessageSlideupViewController.m",
"ViewControllers/ABKInAppMessageFullViewController.m",
"ViewControllers/ABKInAppMessageImmersiveViewController.m",
"ViewControllers/ABKInAppMessageWindowController.m",
"ViewControllers/ABKInAppMessageHTMLFullViewController.m",
"ViewControllers/ABKInAppMessageHTMLViewController.m",
"ViewControllers/ABKInAppMessageHTMLBaseViewController.m"
],
resources: [
.process("Resources/com_appboy_inapp_close_icon@3x.png"),
.process("Resources/FontAwesome.otf"),
.process("Resources/com_appboy_inapp_close_icon.png"),
.process("Resources/com_appboy_inapp_close_icon@2x.png"),
.process("Resources/arrow@2x.png"),
.process("Resources/arrow.png"),
.process("Resources/arrow@3x.png"),
.process("Resources")
           ]
      )


    ]
)
