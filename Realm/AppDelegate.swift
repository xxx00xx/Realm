//
//  AppDelegate.swift
//  Realm
//
//  Created by 古田翔太郎 on 2020/10/01.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //マイグレーション処理(データ変更したため)を行う．
        /*------------------------------ここから-------------------------*/
         let config = Realm.Configuration(
             
             schemaVersion: 4 /*初期値は0*/ ,
             
             migrationBlock: { migration, oldSchemaVersion in
                 if (oldSchemaVersion < 4) {
                 }
         })
         
         Realm.Configuration.defaultConfiguration = config
        
         let realm = try! Realm()
        /*-----------------------------ここまで----------------------------*/
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

