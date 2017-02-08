import PackageDescription

let package = Package(
    name: "ImportTest",
    dependencies: [
      .Package(url: "https://github.com/hackersatcambridge/primes-swift-package", majorVersion: 0)
    ]
)
