//
//  NextWaveApp.swift
//  NextWave
//
//  Created by Eldiiar on 20/5/24.
//

import SwiftUI

@main
struct NextWaveApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage(UserDefaultsStorage.active) private var active = false
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().isTranslucent = true
    }
    
    var body: some Scene {
        WindowGroup {
            if !active {
                AuthView()
            } else {
                mainViewScreen
            }
        }
    }
    
    private var mainViewScreen: some View {
        TabView {
            NavigationStack {
                MainView()
//                    .environmentObject(appState)
            }
            .tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "calendar") }
                )
            }
            .tag(0)
            
            NavigationStack {
                MainView()
//                    .environmentObject(appState)
            }
            .tabItem {
                Label(
                    title: { Text("Create") },
                    icon: { Image(systemName: "plus") }
                )
            }
            .tag(1)
            
            NavigationStack {
                MainView()
//                    .environmentObject(appState)
            }
            .tabItem {
                Label(
                    title: { Text("More") },
                    icon: { Image(systemName: "list.bullet") }
                )
            }
            .tag(2)
        }
        
    }
}
