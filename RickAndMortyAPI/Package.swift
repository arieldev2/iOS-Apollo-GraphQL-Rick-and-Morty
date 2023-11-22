// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "RickAndMortyAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "RickAndMortyAPI", targets: ["RickAndMortyAPI"]),
    .library(name: "RickAndMortyTestMocks", targets: ["RickAndMortyTestMocks"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "RickAndMortyAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "RickAndMortyTestMocks",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "RickAndMortyAPI"),
      ],
      path: "./RickAndMortyTestMocks"
    ),
  ]
)
