// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AnimatingText",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "AnimatingText",
            targets: ["AnimatingText"]
        ),
    ],
    targets: [
        .target(
            name: "AnimatingText",
            dependencies: []
        )
    ]
)
