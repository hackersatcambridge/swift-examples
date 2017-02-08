import PackageDescription

let package = Package(
    name: "CLScraper",
    dependencies: [
        // We use Kanna for HTML parsing
        // WARNING: There are some nuances to importing Kanna to your project
        // Please see the Kanna GitHub page for info
        .Package(url: "https://github.com/tid-kijyun/Kanna.git", majorVersion: 2)
    ]
)
