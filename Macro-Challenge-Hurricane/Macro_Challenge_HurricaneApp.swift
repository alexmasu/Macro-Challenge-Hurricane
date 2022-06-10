//
//  DemoBgTaskApp.swift
//  DemoBgTask
//
//  Created by Alessandro Masullo on 04/06/22.
//

// e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.appleacademy.DemoBgTask.refresh"]

import SwiftUI
import UIKit
import BackgroundTasks

@main
struct Macro_Challenge_HurricaneApp: App {
    
    init() {

        let today = Date()
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .hour, value: -2, to: today)!
        print(modifiedDate)
        
        let temp = MochiJson(maxHunger: 100, maxThirst: 100, maxCleanlyness: 100, maxHealth: 100, maxEnergy: 100, maxHappiness: 100, hunger: 100, thirst: 100, cleanlyness: 100, health: 100, energy: 100, happiness: 100, ageType: 2, sleeping: false, streaming: false, ill: false, pHunger: 0, pThirst: 0, pCleanlyness: 0, pHappyness: 0, pIll: 0, pEnergy: 0, pEnergyGain: 0, nPoop: 0, pPoop: 0, pWake: 0, pHealthHunger: 0, pHealthThirst: 0, pHealthIll: 0, euphoria: false, birth: Date.distantPast, alive: true)
        
        DataManager.standard.setMochi(mochi: temp)
        
        
        let tempTime = TimeManagerJson(lastSave: modifiedDate, savedDate: Date.now, arrayHappyness: [])
        
        DataManager.standard.setTimeManager(timeManager: tempTime)
        
        let timemanager = TimeManager()
        let mochi = Mochi()
        let inventory = Inventory()
        let currencies = Currencies()
        let customInventory = CustomInventory()
        let streamInventory = StreamingInventory()
        
        timemanager.AfterOffline(mochi: mochi, currencies: currencies, streamingInventory: streamInventory)
        print(mochi.thirst)
        print(mochi.pThirst)
        
        mochi.save()
        
        timemanager.save()
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
            TamagotchiView()
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
