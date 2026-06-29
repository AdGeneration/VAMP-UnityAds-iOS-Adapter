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
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPUnityAdsAdapter-v4.18.100.zip",
            checksum: "9be02a8b09e8d88e50be798f21600d29bb74780de9cd8b65e7d459446f52d2b6"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.18.1/UnityAds.zip",
            checksum: "62cac3d0df3c8e0106f364f0e456f4edb42b6364dd9dc44b1d13985f70c2fbd1"
        )
    ]
)
