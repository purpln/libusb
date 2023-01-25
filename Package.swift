// swift-tools-version:5.3

import PackageDescription
#if os(Linux)
let library: PackageDescription.Target = .systemLibrary(name: "clibusb")
#elseif os(macOS)
let library: PackageDescription.Target = .systemLibrary(name: "clibusb", pkgConfig: "libusb")
#endif
let package = Package(
    name: "libusb",
    products: [
        .library(name: "libusb", targets: ["libusb"]),
        .library(name: "clibusb", targets: ["clibusb"])
    ],
    targets: [
        library, .target(name: "libusb", dependencies: ["clibusb"])
    ]
)
