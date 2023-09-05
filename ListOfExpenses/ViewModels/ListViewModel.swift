//
//  ListViewModel.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var listItems: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let itemsData = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: itemsData)
        else { return }
        self.listItems = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        listItems.move(
            fromOffsets: from,
            toOffset: to)
    }
    
    func addItem(title: String, amount: String) {
        let newItem = ItemModel(title: title, isCompleted: false, amount: amount)
        listItems.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = listItems.firstIndex(where: { $0.id == item.id }) {
            listItems[index] = item.updateCompilation()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
