//
//  AppDelegate.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        let items = DataSource.getData()
        let items2 = DataSource.getData2x2()
        
//        let dataSource = GenericDataSource<Contact, SelfSizingCell>(values: items)
//        let viewModel = SelfSizingCellViewModel(dataSource: dataSource)
//        let vc = SelfSizingCellVC(title: "Contacts", viewModel: viewModel)
        
        
//        let dataSource = GenericDataSource<Contact, MasterCell2>(values: items)
//        let viewModel = SelfSizingNibViewModel(dataSource: dataSource)
//        let vc = SelfSizingNibVC(title: "Contacts", viewModel: viewModel)
        
        
        
        
        let dataSource = GenericDataSource<Contact, SelfSizingDelegateCell>(values3: items2, cellIdentifierHeader: SelfSizingHeaderView.cellIdentifier) { (header, title) in
            if let header = header as? SelfSizingHeaderView {
                header.configure(title: title)
            }
        }
        
//        let dataSource = GenericDataSource<Contact, SelfSizingDelegateCell>(values2: items2)
        
//        let dataSource2 = GenericDataSource<Contact, SelfSizingDelegateCell>(values2: items2, configureHeader: SelfSizingHeaderView.configure(_:_:), cellIdentifierHeader: SelfSizingHeaderView.cellIdentifier)
        
//        let dataSource = GenericDataSource<Contact, SelfSizingDelegateCell>(values2: items2, configureHeader: { (header, title) in
//            if let header = header as? SelfSizingHeaderView {
//                header.configure(title: title)
//            }
//        }, cellIdentifierHeader: SelfSizingHeaderView.cellIdentifier)
        
        let viewModel = SelfSizingDeletateViewModel(dataSource: dataSource)
        let vc = SelfSizingDelegateVC(title: "Contacts", viewModel: viewModel)
        

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        return true
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

