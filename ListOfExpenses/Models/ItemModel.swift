//
//  ItemModel.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let amount: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, amount: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.amount = amount
    }
    
    func updateCompilation() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, amount: amount)
    }
}
