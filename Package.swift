// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "PBBase32",
    products: [
        .library(name: "PBBase32", targets: ["PBBase32"]),
        ],
    targets: [
        .target(
            name: "PBBase32",
            dependencies: []),
        .testTarget(
            name: "PBBase32Tests",
            dependencies: ["PBBase32"])
        ]
)
