// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SubstiDomain",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "SubstiDomain", targets: ["SubstiDomain"])
    ],
    targets: [
        .target(name: "SubstiDomain")
    ]
)
