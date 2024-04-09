// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "VcIssuance",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VcIssuance",
            targets: ["VcIssuance"]),
    ],
    dependencies: [
        // Add the dependency on Swift JWT
        .package(url: "https://github.com/Kitura/Swift-JWT.git", from: "4.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VcIssuance",
            dependencies: [.product(name: "SwiftJWT", package: "Swift-JWT")]),
        .testTarget(
            name: "VcIssuanceTests",
            dependencies: ["VcIssuance"]),
    ]
)
