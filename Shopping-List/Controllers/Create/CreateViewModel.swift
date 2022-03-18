//
//  CreateViewModel.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import Foundation

class CreateViewModel {
    
    private let taskManager = TaskManager.shared
    var onReturn: (() -> Void)?
    
    func saveItem(nameField: String?, quantityField: String?) {
        let newItem = TaskManager.ShoppingItem(name: nameField, quantity: quantityField)
        taskManager.save(item: newItem)
        onReturn?()
    }
}
