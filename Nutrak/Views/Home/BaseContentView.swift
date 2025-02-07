//
//  BaseContentView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI
import AVFoundation

struct BaseContentView: View {
    @State private var selectedTab = 0
    @State private var isCameraPresented = false
    @State private var navigateToScanning = false
    @State private var navigateToResults = false

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeTabView()
                    .tabItem { Image("homeTabIcon") }
                    .tag(0)
                
                Text("Logs Screen")
                    .tabItem { Image("logsTabIcon") }
                    .tag(1)
                
                Text("") // Placeholder tab for camera
                    .tabItem { Image("cameraTabIcon") }
                    .tag(2)
                    .onAppear {
                        isCameraPresented = true
                    }
                    .fullScreenCover(isPresented: $isCameraPresented) {
                        CameraView(isPresented: $isCameraPresented, navigateToScanning: $navigateToScanning)
                    }
                
                Text("Streaks Screen")
                    .tabItem { Image("streakTabIcon") }
                    .tag(3)
                
                Text("Profile Screen")
                    .tabItem { Image("profileTabIcon") }
                    .tag(4)
            }
            .background(
                NavigationLink(destination: ScanningScreen(navigateToResults: $navigateToResults), isActive: $navigateToScanning) {
                    EmptyView()
                }
                .hidden()
            )
            .background(
                NavigationLink(destination: NutritionResultsView(navigateBackToHome: $navigateToScanning), isActive: $navigateToResults) {
                    EmptyView()
                }
                .hidden()
            )
        }.navigationBarHidden(true)
    }
}


