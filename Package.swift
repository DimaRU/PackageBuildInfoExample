// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "PackageBuildInfoExample",
    dependencies: [
        .package(url: "https://github.com/DimaRU/PackageBuildInfo", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "PackageBuildInfoExample",
            plugins: [
                .plugin(name: "PackageBuildInfoPlugin", package: "PackageBuildInfo")
            ]),
    ]
)
