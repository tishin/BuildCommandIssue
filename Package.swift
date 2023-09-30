// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildCommandIssue",
    products: [
    ],
    targets: [
        .executableTarget(
            name: "Generator"),
        
        .plugin(
            name: "GeneratorPlugin",
            capability: .buildTool(),
            dependencies: ["Generator"]
        ),
        
        .target(
            name: "Consumer",
            plugins: ["GeneratorPlugin"]),
    ]
)
