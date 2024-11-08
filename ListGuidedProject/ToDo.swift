//
//  ToDo.swift
//  ListGuidedProject
//
//  Created by Skyler Robbins on 11/7/24.
//

import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([ToDo].self, from: codedToDos)
    }
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    static func loadSampleToDos() -> [ToDo] {
        [
            ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1"),
            ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2"),
            ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        ]
    }
}
