//
//  color_selection.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/13.
//

import SwiftUI

enum ColorScheme: Int {
    case unspecified, light, dark

}

class ColorSchemeManager: ObservableObject {
    @AppStorage("colorScheme") var colorScheme: ColorScheme = .unspecified {
        didSet {
            applyColorScheme()
        }
    }
    
    func applyColorScheme() {
        UIWindow.key?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue)!
    }
}
