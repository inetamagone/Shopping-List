//
//  MainViewModel.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import Foundation

class MainViewModel {
    
    private let taskManager = TaskManager.shared
    var onCreateItem: (() -> Void)?
    
    func createItem() {
        self.onCreateItem?()
    }
    
    func getItemCount() -> Int {
        return taskManager.itemCount()
    }
    
    func getItem(at indexPath: IndexPath) -> TaskManager.ShoppingItem? {
        return taskManager.getItem(at: indexPath.row)
    }
}
