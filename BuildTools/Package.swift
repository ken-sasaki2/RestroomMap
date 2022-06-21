// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", .upToNextMajor(from: "0.43.1")),
        // .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "8.0")),
    ],
    targets: [
        .target(
            name: "BuildTools",
            path: ""
        ),
//        .target(
//            name: "RestroomMap",
//            dependencies: [
//                .product(name: "FirebaseAuth", package: "Firebase"),
//            ]
//        )
    ]
)
