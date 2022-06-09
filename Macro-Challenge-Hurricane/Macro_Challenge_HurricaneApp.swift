//
//  DemoBgTaskApp.swift
//  DemoBgTask
//
//  Created by Alessandro Masullo on 04/06/22.
//

// e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"refresh"]

import SwiftUI
import UIKit
import BackgroundTasks

@main
struct Macro_Challenge_HurricaneApp: App {
    
    init() {
//        DataManager.standard.setMochi(mochi: MochiJson())
        print(DataManager.standard.getMochi())
//                let mochi = Mochi()
//                mochi.save()
        
    }
    
    @UIApplicationDelegateAdaptor var delegate: FSAppDelegate
    
    var body: some Scene {
        WindowGroup {
            //                        TamagotchiView()
            //                        .statusBar(hidden: true)
            //                        .ignoresSafeArea()
            //                        BathroomSceneView()
            //                            .statusBar(hidden: true)
            //                            .ignoresSafeArea()
            BedroomView()
                .statusBar(hidden: true)
                .ignoresSafeArea()
        }
    }
}






class FSAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    @Published var date: Date = .now
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .assign(to: &$date)
        
        
        // MARK: Registering Launch Handlers for Tasks
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "refresh", using: nil) { task in
            //            self.handleAppRefresh(task: task as! BGAppRefreshTask)
            let appRefresh = FSSceneDelegate()
            appRefresh.handleAppRefresh(task: task as! BGAppRefreshTask)
            
        }
        
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = FSSceneDelegate.self
        return sceneConfig
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
}


class FSSceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {}
    
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        scheduleAppRefresh()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // ...
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // ...
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // ...
    }
    
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "refresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 10 * 60) // Fetch no earlier than 1 minutes from now
        //        request.earliestBeginDate = Date(timeIntervalSinceNow: 0)
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Submitted task request")
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
    
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        print("Refresh called")
        scheduleAppRefresh()
        let operationQueue = OperationQueue()
        let refreshOperation = BlockOperation {
            
            //            let mochi = Mochi()
            //            mochi.save()
            
            //            DataManager.standard.setMochi(mochi: MochiJson())
            //            print(DataManager.standard.getMochi())
            
        }
        
        task.expirationHandler = {
            refreshOperation.cancel()
        }
        
        refreshOperation.completionBlock = {
            task.setTaskCompleted(success: !refreshOperation.isCancelled)
        }
        operationQueue.addOperation(refreshOperation)
    }
}
