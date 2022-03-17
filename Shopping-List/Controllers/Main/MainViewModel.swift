//
//  MainViewModel.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import Foundation

class MainViewModel {
    
    var onCreateItem: (() -> Void)?
    
    func createItem() {
        self.onCreateItem?()
    }
}
