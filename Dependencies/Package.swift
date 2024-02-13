// swift-tools-version: 5.9
import PackageDescription


#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers


    let packageSettings = PackageSettings(
        productTypes: [
            "Kingfisher": .framework, // default is .staticFramework
        ],
        platforms: [.iOS]
    )
#endif


let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", upToNextMajor: "7.0.0"),
    ]
)
