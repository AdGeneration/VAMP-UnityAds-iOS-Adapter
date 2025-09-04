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
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPUnityAdsAdapter-v4.16.100.zip",
            checksum: "7121fd6fa18bd2ea555850f8a419f927c935cae0d293e237aab217b3edb7251e"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.1/UnityAds.zip",
            checksum: "cb8ba2a90c8f16ccafd5958d4d8457dab578865629dd3aa1ac1fc4677ec9cf54"
        )
    ]
)
