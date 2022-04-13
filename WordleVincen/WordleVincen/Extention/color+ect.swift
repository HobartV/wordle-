//
//  color+ect.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/9.
//

import SwiftUI

extension Color
{
    static var wrong: Color {
        Color(.red)
    }
    static var misplaced: Color {
        Color(.yellow)
    }
    static var correct: Color {
        Color(.green)
    }
    static var unused: Color {
        Color(.gray	)
    }
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}
