//
//  ContentView.swift
//  WeSplit
//
//  Created by Stoyan Hristov on 28.12.25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isEditingCheckAmountFocussed: Bool

    private let tipPercentages = [5, 10, 15, 20, 25, 0]

    private var totalPerPerson: Double {
        let peopleCountAsDouble = Double(numberOfPeople)
        let tipPercentageAsDouble = Double(tipPercentage)

        let tipAmount = (checkAmount / 100) * tipPercentageAsDouble
        let totalAmount = checkAmount + tipAmount

        let amountPerPerson = totalAmount / peopleCountAsDouble

        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "BGN"
                        )
                    )
                    .keyboardType(.decimalPad)
                    .focused($isEditingCheckAmountFocussed)

                    Picker("Number of people: ", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people").tag($0)
                        }
                    }
                }

                Section("How much do you want to tip?") {
                    Picker("Tip Presentace", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { Text("\($0, format: .percent)") }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Bill per person:") {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "BGN"
                        )
                    )
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isEditingCheckAmountFocussed {
                    Button("Done") {
                        isEditingCheckAmountFocussed = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
