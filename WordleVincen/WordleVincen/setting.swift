	//
//  setting.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/13.
//

import SwiftUI

struct setting: View {
    @EnvironmentObject var dm: WordDataModel
    @EnvironmentObject var csManager: ColorSchemeManager
    @Environment(\.presentationMode) var presentationMode
    @State var n0 = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("Change Theme")
                Picker("Display Mode", selection: $csManager.colorScheme) {
                    Text("Dark").tag(ColorScheme.dark)
                    Text("Light").tag(ColorScheme.light)
                    Text("System").tag(ColorScheme.unspecified)
                }
                . pickerStyle(SegmentedPickerStyle())
                Spacer()
                Text("Chose Letter")
                
                Picker("Letters", selection: $dm.numLetter) {
                                    ForEach(5...7, id:\.self) { num in
                                        Text(String(num))
                                    }
                                }
                                .onChange(of:dm.numLetter) { _ in
                                    n0 = dm.numLetter
                                    dm.newGame()
                                
                                }.pickerStyle(SegmentedPickerStyle())
                
                Spacer()

                
                
                
                
            }.padding()
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

struct setting_Previews: PreviewProvider {
    static var previews: some View {
        setting()
            .environmentObject(ColorSchemeManager())
    }
}
    
