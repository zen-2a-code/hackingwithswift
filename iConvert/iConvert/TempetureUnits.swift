//
//  TempetureUnits.swift
//  iConvert
//
//  Created by Stoyan Hristov on 29.12.25.
//


enum TempetureUnits: String, CaseIterable, Identifiable {
    case celsius, fahrenheit, kelvin
    var id: Self { self }

    var symbol: String {
        switch self {
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        case .kelvin: return "K"
        }
    }

    func convert(_ value: Double, to target: TempetureUnits) -> Double {
        let kelvin: Double = {
            switch self {
            case .celsius: return value + 273.15
            case .fahrenheit: return (value - 32) * 5/9 + 273.15
            case .kelvin: return value
            }
        }()

        switch target {
        case .celsius: return kelvin - 273.15
        case .fahrenheit: return (kelvin - 273.15) * 9/5 + 32
        case .kelvin: return kelvin
        }
    }
}