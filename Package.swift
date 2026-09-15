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
            url: "https://github.com/AdGeneration/VAMP-UnityAds-iOS-Adapter/releases/download/4.20.100/VAMPUnityAdsAdapter-v4.20.100.zip",
            checksum: "a2e792debcccc62a07fa32c305d7c1e927dce1b2da11b605fe26b61f480b949a"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.20.1/UnityAds.zip",
            checksum: "c7fba62bec9fe1f703caf83931cce65452bbfca4a3e742c338d57d845c4ad840"
        )
    ]
)
