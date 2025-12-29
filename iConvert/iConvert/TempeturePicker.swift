//
//  TemeturePicker.swift
//  iConvert
//
//  Created by Stoyan Hristov on 29.12.25.
//

import SwiftUI


struct TempeturePicker: View {
    @Binding var selectedTempetureUnit: TempetureUnits
    
    init(_ selectedTempetureUnit: Binding<TempetureUnits>) {
        self._selectedTempetureUnit = selectedTempetureUnit
    }
    
    var body: some View {
        Picker("Convert from", selection: $selectedTempetureUnit) {
            ForEach(TempetureUnits.allCases) {
                Text($0.rawValue.capitalized).tag($0)
            }
        }
        .pickerStyle(.palette)
    }
}
