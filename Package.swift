// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleTooltip",
    products: [
        .library(
            name: "SimpleTooltip",
            targets: ["SimpleTooltip"]),
    ],
    targets: [
        .target(
            name: "SimpleTooltip"),
        .testTarget(
            name: "SimpleTooltipTests",
            dependencies: ["SimpleTooltip"]
        ),
    ]
)
