//
//  ToDo.swift
//  ListGuidedProject
//
//  Created by Skyler Robbins on 11/7/24.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    static func loadSampleToDos() -> [ToDo] {
        [
            ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1"),
            ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2"),
            ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        ]
    }
}
