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
        let quantity: Int?
    }
    
    private var shoppingItems: [ShoppingItem] = []
    
    static let shared = TaskManager()
    
    private init() {}
    
}
