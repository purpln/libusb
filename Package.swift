// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "libusb",
    products: [.library(name: "libusb", targets: ["libusb"])],
    targets: [.systemLibrary(name: "clibusb", pkgConfig: "libusb"), .target(name: "libusb", dependencies: ["clibusb"])]
)
