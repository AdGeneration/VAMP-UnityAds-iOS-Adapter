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
            url: "https://github.com/AdGeneration/VAMP-UnityAds-iOS-Adapter/releases/download/4.20.0/VAMPUnityAdsAdapter-v4.20.0.zip",
            checksum: "ce23352807c8a3efb690a4feeac9f04feddd5d7134dc8656485db8e2d6095a61"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.20.0/UnityAds.zip",
            checksum: "7084559dd2d2ed4c6bf2244917fee557db67e21fef66796c7e42da2bae6685d4"
        )
    ]
)
