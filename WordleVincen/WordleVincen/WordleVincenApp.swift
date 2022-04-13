//
//  WordleVincenApp.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/9.
//

import SwiftUI

@main
struct WordleVincenApp: App {
    @StateObject var dm = WordDataModel()
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dm)
                .environmentObject(csManager)
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}
