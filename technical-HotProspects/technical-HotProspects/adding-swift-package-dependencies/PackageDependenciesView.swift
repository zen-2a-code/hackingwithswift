//
//  PackageDependenciesView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import SamplePackage
import SwiftUI

struct PackageDependenciesView: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let stringsArray = selected.map(String.init)
        return stringsArray.formatted() // or if we want only commas as seperator - stringsArray.joined(separator: ", ") 
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    PackageDependenciesView()
}
