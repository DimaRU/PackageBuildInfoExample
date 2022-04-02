// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "PackageBuildInfoExample",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/DimaRU/PackageBuildInfo", branch: "master")
    ],
    targets: [
        .executableTarget(
            name: "PackageBuildInfoExample",
            plugins: [
                .plugin(name: "packageBuildInfoPlugin", package: "PackageBuildInfo")
            ]),
    ]
)
