// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PetFocus",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PetFocus",
            targets: ["PetFocus"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PetFocus",
            dependencies: []),
        .testTarget(
            name: "PetFocusTests",
            dependencies: ["PetFocus"]),
    ]
)
