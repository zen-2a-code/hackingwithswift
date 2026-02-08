//
//  Order.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 7.02.26.
//

import Foundation

struct HttpBinResponse: Codable {
    var json: Order
}

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _typeIndex = "typeIndex"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var typeIndex = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(typeIndex) / 2
        
        if specialRequestEnabled {
            if extraFrosting {
                cost += Decimal(quantity)
            }
            
            if addSprinkles {
                cost += Decimal(quantity) / 2
            }
        }
        
        return cost
    }
}
