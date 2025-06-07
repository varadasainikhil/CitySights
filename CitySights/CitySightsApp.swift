//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var businessViewModel = BusinessViewModel()
    @AppStorage("needsOnBoarding") var needsOnBoarding = true
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(businessViewModel)
                .fullScreenCover(isPresented: $needsOnBoarding, onDismiss: {
                    needsOnBoarding = false
                }, content: {
                    OnboardingView()
                        .environment(businessViewModel)
                })
        }
    }
}
