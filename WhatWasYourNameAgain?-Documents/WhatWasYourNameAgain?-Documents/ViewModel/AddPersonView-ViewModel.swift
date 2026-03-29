//
//  AddPersonView-ViewModel.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 21.03.26.
//

import Foundation

extension AddPersonView {
    @Observable
    class ViewModel {
        var name = ""
        var data: Data?
        var locationFetcher = LocationFetcher()
        
        func canSave() -> Bool {
            !name.isEmpty && data != nil
        }
    }
}
