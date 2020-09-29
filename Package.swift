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
		.library(name: "Appboy_iOS_SDK", targets: [ "AppboyKit", "AppboyKitSourcesAndResources" ]),
		.library(name: "AppboyUI_iOS_SDK", targets: [ "AppboyUI" ])
	],
	dependencies: [
		.package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
	],
	targets: [
	  .target(
	    name: "AppboyKitSourcesAndResources",
	    dependencies: [ "SDWebImage" ],
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
	    publicHeadersPath: "headers/AppboyKitLibrary",
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
			dependencies: [ "SDWebImage", "AppboyKit" ],
			path: "AppboyUI",
			sources: [
				"ABKNewsFeed",
				"ABKNewsFeed/ViewControllers/Cells",
				"ABKNewsFeed/ViewControllers/",
				"ABKInAppMessage",
				"ABKInAppMessage/ViewControllers",
				"ABKContentCards/ViewControllers",
				"ABKContentCards/ViewControllers/Cells",
				"ABKContentCards",
				"ABKUIUtils"
                        ],
			resources: [
				.process("ABKNewsFeed/Resources"),
				.process("ABKInAppMessage/Resources"),
				.process("ABKContentCards/Resources")
			],
			publicHeadersPath: "",
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
