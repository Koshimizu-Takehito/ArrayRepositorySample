//
//  AppDelegate.swift
//  ArrayRepositorySample
//
//  Created by Takehito Koshimizu on 2022/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        .init(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}
