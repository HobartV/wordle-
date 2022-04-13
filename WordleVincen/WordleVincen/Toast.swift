//
//  Toast.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/11.
//

import SwiftUI
struct Toast: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        Toast(toastText: "Not in word list.")
    }
}
