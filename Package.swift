// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "cli-config-tool",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.0.0"
                        )
                      ],
    targets: [
        .executableTarget(
            name: "cli-config-tool",
            dependencies: [
                .product(name:"ArgumentParser",
                         package: "swift-argument-parser")
            ]
                          )
    ]
)
