//
//  ContentView.swift
//  iConvert
//
//  Created by Stoyan Hristov on 29.12.25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedInputTempetureUnit: TempetureUnits = .celsius
    @State private var selectInputTemperatureValue: Double = 0.0
    @State private var selectedOuputTempetureUnit: TempetureUnits = .fahrenheit
    @FocusState private var isInputFiledFocused: Bool

    private var result: Double {
        selectedInputTempetureUnit.convert(selectInputTemperatureValue, to: selectedOuputTempetureUnit)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from") {
                    TempeturePicker($selectedInputTempetureUnit)

                    HStack {
                        TextField("Enter a tempeture", value: $selectInputTemperatureValue, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isInputFiledFocused)
                        Text(selectedInputTempetureUnit.symbol)
                            .foregroundStyle(.secondary)
                    }
                }

                Section("Convert to") {
                    TempeturePicker($selectedOuputTempetureUnit)
                }

                Section("Result") {
                    Text("\(result, format: .number.precision(.fractionLength(2))) \(selectedOuputTempetureUnit.symbol)")
                }
            }.onTapGesture {
                isInputFiledFocused.toggle()
            }
            .navigationTitle("iConvert")
            .toolbar {
                if isInputFiledFocused {
                    Button("Done") {
                        isInputFiledFocused.toggle()
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
