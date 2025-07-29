// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-UnityAds-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPUnityAdsAdapter",
            targets: ["VAMPUnityAdsAdapterTarget"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPUnityAdsAdapterTarget",
            dependencies: [
                .target(name: "VAMPUnityAdsAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .target(name: "UnityAds"),
            ],
            path: "VAMPUnityAdsAdapterTarget"
        ),
        
        .binaryTarget(
            name: "VAMPUnityAdsAdapter",
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPUnityAdsAdapter-v4.16.0.zip",
            checksum: "099c1068bbba15f8c9e976ddc24469c27deccc86e5fea0a87fbfb50533adfef0"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.0/UnityAds.zip",
            checksum: "60538a0a7d7b4467a4d4bd302154e99a56f95fb680801da63da6395be92c92cf"
        )
    ]
)
