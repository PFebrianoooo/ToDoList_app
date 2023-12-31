//
//  File.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import Foundation

struct ListModel: Identifiable, Codable {
    let id: String
    let isComplete: Bool
    let value: String
    
    init(id: String = UUID().uuidString, isComplete: Bool, value: String) {
        self.id = UUID().uuidString
        self.isComplete = isComplete
        self.value = value
    }
    
    func updateCompletion() -> ListModel {
        return ListModel(id: id, isComplete: !isComplete, value: value)
    }
}
