//
//  Package.swift
//  ETSocket
//
//  Created by Bill Abt on 1/19/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import PackageDescription

let package = Package(
	name: "ETSocket",
	targets: [Target(name: "ETSocket")],
    dependencies: [
                      .Package(url: "https://github.com/tkhuran/CCryptoSSL.git", majorVersion: 0,minor: 1),
                      .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 0, minor: 5),
    ],
	exclude: ["ETSocket.xcodeproj", "ETSocket.xcworkspace", "README.md", "Sources/Info.plist"]
)
