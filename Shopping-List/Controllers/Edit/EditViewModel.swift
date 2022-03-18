//
//  EditViewModel.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import Foundation

class EditViewModel {
    
    private let taskManager = TaskManager.shared
    var index: Int = 0
    var item: TaskManager.ShoppingItem?
    var onReturn: (() -> Void)?
    
    func getItem(at index: Int) {
        self.index = index
        item = taskManager.getItem(at: index)
    }
    
    func editItem(name: String?, quantity: String) {
        let item = TaskManager.ShoppingItem(name: name, quantity: quantity)
        taskManager.editItem(item: item, at: index)
        onReturn?()
    }
}
