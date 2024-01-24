import ProjectDescription

let unitTestsTarget = Target(name: "FoodMarketTests",
                             destinations: .iOS,
                             product: .unitTests,
                             bundleId: "com.foodmarket.unit.tests",
                             sources: "FoodMarketTests/**",
                             dependencies: [.target(name: "FoodMarketApp")])

let uiTestsTarget = Target(name: "FoodMarketUITests",
                           destinations: .iOS,
                           product: .unitTests,
                           bundleId: "com.foodmarket.ui.tests",
                           sources: "FoodMarketUITests/**",
                           dependencies: [.target(name: "FoodMarketApp")])


let mainAppTarget = Target(name: "FoodMarketApp",
                           destinations: .iOS,
                           product: .app,
                           bundleId: "com.foodmarket.app",
                           deploymentTargets: .iOS("14.0"),
                           infoPlist: .extendingDefault(with: ["UILaunchScreen": .string("")]),
                           sources: "FoodMarket/**",
                           dependencies: [],
                           coreDataModels: [
                            CoreDataModel("FoodMarket/FoodMarket.xcdatamodeld")
                           ])

let project = Project(name: "FoodMarket",
                      targets: [
                        mainAppTarget,
                        unitTestsTarget,
                        uiTestsTarget
                      ])
