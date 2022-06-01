//
//  Macro_Challenge_HurricaneApp.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 13/05/22.
//

import SwiftUI
import BackgroundTasks

@main
struct Macro_Challenge_HurricaneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    var mochi = Mochi(MaxHunger: 1, MaxThirst: 1, MaxCleanlyness: 1, MaxHealth: 1, MaxEnergy: 1, MaxHappyness: 1, Hunger: 1, Thirst: 1, Cleanlyness: 1, Health: 1, Energy: 1, Happiness: 1, AgeType: 0, Followers: 1, Alive: false)
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate : UIResponder, UIApplicationDelegate{
    var window: UIWindow?
    func applicationDidEnterBackground(_ application: UIApplication, mochi :Mochi, currencies : Currencies, timeManager: TimeManager) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        timeManager.saveDate()
        if mochi.streaming == true{
            timeManager.dateAppend()
        }
        UserDefaults.standard.set(mochi, forKey: "mochi")
        UserDefaults.standard.set(currencies, forKey: "currencies")
        UserDefaults.standard.set(timeManager, forKey: "timeManager")
        
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // codice per il bg
        var mochi = (UserDefaults.standard.object(forKey: "mochi")) as! Mochi
        var currencies = UserDefaults.standard.object(forKey: "currencies") as! Currencies
        var timeManager = UserDefaults.standard.object(forKey: "timeManager") as! TimeManager
        
        timeManager.AfterOffline(mochi: mochi, currencies: currencies)
        
        UserDefaults.standard.set(mochi, forKey: "mochi")
        UserDefaults.standard.set(currencies, forKey: "currencies")
        UserDefaults.standard.set(timeManager, forKey: "timeManager")
        
        registerBackgroundTasks()
        return true
    }
    
    func registerBackgroundTasks(){
        
        let backgroundAppRefreshTaskSchedulerIdentifier = "BackGroundAppRefreshIdentifier"
        let backgroundProcessingTaskSchedulerIdentifier = "BackGroundProcessingIdentifier"
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: backgroundAppRefreshTaskSchedulerIdentifier, using: nil) {
            (task) in
            print(" BackgroundAppRefreshTaskScheduler is executed now")
            print ("background time remaining \(UIApplication.shared.backgroundTimeRemaining)")
            task.expirationHandler = {
                task.setTaskCompleted(success: false)
            }
            
//          do some data fetching and call settaskcompleted ( success: ) asap
            let isFetchingSuccess = true
            task.setTaskCompleted(success: isFetchingSuccess)
            
        }
        
        
    }
    
    func submitBackgroundTasks(){
        let backgroundAppRefreshTaskSchedulerIdentifier = "BackGroundAppRefresherIdentifier"
        let timeDelay = 1800

            do {
              let backgroundAppRefreshTaskRequest = BGAppRefreshTaskRequest(identifier: backgroundAppRefreshTaskSchedulerIdentifier)
                backgroundAppRefreshTaskRequest.earliestBeginDate = Date(timeIntervalSinceNow: TimeInterval(timeDelay))
              try BGTaskScheduler.shared.submit(backgroundAppRefreshTaskRequest)
              print("Submitted task request")
            }
        catch {
              print("Failed to submit BGTask")
            }
    }
}

