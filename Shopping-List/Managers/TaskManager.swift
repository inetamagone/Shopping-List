//
//  TaskManager.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import Foundation

final class TaskManager {
    
    struct ShoppingItem {
        let name: String?
        let quantity: String?
    }
    
    private var shoppingItems: [ShoppingItem] = []
    
    static let shared = TaskManager()
    
    private init() {}
    
    func itemCount() -> Int {
        return shoppingItems.count
    }
    
    func save(item: ShoppingItem) {
        shoppingItems.append(item)
    }
    
    func getItem(at index: Int) -> ShoppingItem? {
        guard index < shoppingItems.count else { return nil }
        return shoppingItems[index]
    }
    
    func editItem(item: ShoppingItem, at index: Int) {
        guard index < shoppingItems.count else { return }
        shoppingItems[index] = item
    }
    
    func deleteItems() {
        shoppingItems = []
    }
}
