// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PetFocus",
    platforms: [
        .iOS(.v10)
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
