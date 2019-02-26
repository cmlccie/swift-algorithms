// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAlgorithms",
    products: [
        .library(
            name: "SwiftAlgorithms",
            targets: ["SwiftAlgorithms"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftAlgorithms",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SwiftAlgorithmsTests",
            dependencies: ["SwiftAlgorithms"],
            path: "Tests"),
    ]
)
