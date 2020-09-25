// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "Appboy_iOS_SDK",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v10_10),
		.iOS(.v9),
		.tvOS(.v9)
	],
	products: [
		.library(name: "Appboy_iOS_SDK", targets: [ "AppboyKit", "AppboyKitSourcesAndResources "]),
		.library(name: "AppboyUI_iOS_SDK", targets: [ "AppboyUI" ])
	],
	dependencies: [
		.package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
	],
	targets: [
	  .target(
	    name: "AppboyKitSourcesAndResources",
	    path: "AppboyKit",
	    sources: [
	      "ABKLocationManagerProvider.m",
	      "ABKNoConnectionLocalization.m",
	      "ABKModalWebViewController.m",
	      "ABKSDWebImageProxy.m"
	    ],
	    resources: [
	      .process("Appboy.bundle")
	    ],
	    cSettings: [
				.headerSearchPath("headers/AppboyKitLibrary"),
			]
	  ),
		.binaryTarget(
			name: "AppboyKit",
			url: "https://dl.dropboxusercontent.com/s/b00s8m4gg8a5uhd/AppboyKit.xcframework.zip?dl=1",
            checksum: "8f8e08083deb6394104172eab2ae8d2cae43a2c17a5ccf85414d8472e003f878"
		),
		.target(
		  name: "AppboyUI",
			dependencies: ["SDWebImage", "AppboyKit"],
			path: "AppboyUI",
			sources: [
				"ABKNewsFeed/AppboyNewsFeed.h",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFClassicCardCell.m",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFBannerCardCell.h",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFCaptionedMessageCardCell.h",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFBaseCardCell.m",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFClassicCardCell.h",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFBannerCardCell.m",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFCaptionedMessageCardCell.m",
				"ABKNewsFeed/ViewControllers/Cells/ABKNFBaseCardCell.h",
				"ABKNewsFeed/ViewControllers/ABKNewsFeedTableViewController.m",
				"ABKNewsFeed/ViewControllers/ABKNewsFeedViewController.h",
				"ABKNewsFeed/ViewControllers/ABKFeedWebViewController.h",
				"ABKNewsFeed/ViewControllers/ABKNewsFeedTableViewController.h",
				"ABKNewsFeed/ViewControllers/ABKFeedWebViewController.m",
				"ABKNewsFeed/ViewControllers/ABKNewsFeedViewController.m",
				"ABKInAppMessage/ABKInAppMessageWindow.m",
				"ABKInAppMessage/ABKInAppMessageUIButton.m",
				"ABKInAppMessage/ABKInAppMessageView.m",
				"ABKInAppMessage/ABKInAppMessageUIController.m",
				"ABKInAppMessage/AppboyInAppMessage.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageFullViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageModalViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageWindowController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLFullViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageImmersiveViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageSlideupViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLBaseViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageModalViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageFullViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageImmersiveViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageWindowController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLFullViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLViewController.m",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageSlideupViewController.h",
				"ABKInAppMessage/ViewControllers/ABKInAppMessageHTMLBaseViewController.m",
				"ABKInAppMessage/ABKInAppMessageWindow.h",
				"ABKInAppMessage/ABKInAppMessageView.h",
				"ABKInAppMessage/ABKInAppMessageUIButton.h",
				"ABKInAppMessage/ABKInAppMessageUIDelegate.h",
				"ABKInAppMessage/ABKInAppMessageUIController.h",
				"ABKContentCards/ViewControllers/ABKContentCardsViewController.h",
				"ABKContentCards/ViewControllers/Cells/ABKBaseContentCardCell.h",
				"ABKContentCards/ViewControllers/Cells/ABKClassicContentCardCell.h",
				"ABKContentCards/ViewControllers/Cells/ABKClassicImageContentCardCell.h",
				"ABKContentCards/ViewControllers/Cells/ABKBannerContentCardCell.h",
				"ABKContentCards/ViewControllers/Cells/ABKCaptionedImageContentCardCell.h",
				"ABKContentCards/ViewControllers/Cells/ABKClassicImageContentCardCell.m",
				"ABKContentCards/ViewControllers/Cells/ABKClassicContentCardCell.m",
				"ABKContentCards/ViewControllers/Cells/ABKBaseContentCardCell.m",
				"ABKContentCards/ViewControllers/Cells/ABKBannerContentCardCell.m",
				"ABKContentCards/ViewControllers/Cells/ABKCaptionedImageContentCardCell.m",
				"ABKContentCards/ViewControllers/ABKContentCardsTableViewController.m",
				"ABKContentCards/ViewControllers/ABKContentCardsWebViewController.m",
				"ABKContentCards/ViewControllers/ABKContentCardsTableViewController.h",
				"ABKContentCards/ViewControllers/ABKContentCardsViewController.m",
				"ABKContentCards/ViewControllers/ABKContentCardsWebViewController.h",
				"ABKContentCards/AppboyContentCards.h",
				"ABKUIUtils/ABKUIUtils.m",
				"ABKUIUtils/ABKUIURLUtils.m",
				"ABKUIUtils/ABKUIUtils.h",
				"ABKUIUtils/ABKUIURLUtils.h"
			],
			resources: [
				.process("ABKNewsFeed/Resources"),
				.process("ABKInAppMessage/Resources"),
				.process("ABKContentCards/Resources")
			],
			cSettings: [
				.headerSearchPath("ABKNewsFeed"),
				.headerSearchPath("ABKNewsFeed/ViewControllers/Cells"),
				.headerSearchPath("ABKNewsFeed/ViewControllers"),
				.headerSearchPath("ABKContentCards"),
				.headerSearchPath("ABKContentCards/ViewControllers"),
				.headerSearchPath("ABKContentCards/ViewControllers/Cells"),
				.headerSearchPath("ABKInAppMessage"),
				.headerSearchPath("ABKInAppMessage/ViewControllers"),
				.headerSearchPath("ABKUIUtils")
		  ]
		)
  ]
)
