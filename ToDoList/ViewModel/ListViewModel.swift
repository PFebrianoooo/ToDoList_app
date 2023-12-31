//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var dataList: [ListModel] = [] {
        didSet {
            saveItems()
        }
    }
    // encode data title
    let itemKey: String = "Item_List"
    
    init() {
        combineData()
    }
    
    // combine data
    func combineData() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ListModel].self, from: data)
        else { return }
        
        self.dataList = savedItems
    }
    
    // delete data
    func deleteItems(indexset: IndexSet) {
        dataList.remove(atOffsets: indexset)
    }
    
    // Move Data
    func moveItems(indexset: IndexSet, endPosition: Int) {
        dataList.move(fromOffsets: indexset, toOffset: endPosition)
    }
    
    // add items view
    func addItems(value: String) {
        let addItems: ListModel = ListModel(isComplete: false, value: value)
        dataList.append(addItems)
    }
    
    // update items
    func updateItem(item: ListModel) {
        if let index = dataList.firstIndex(where: {$0.id == item.id}) {
            dataList[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(dataList) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}
