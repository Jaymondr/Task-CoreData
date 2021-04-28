//
//  Task+convenience.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(notes: String?, name: String, isComplete: Bool = false, dueDate: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.notes = notes
        self.name = name
        self.isComplete = isComplete
        self.dueDate = dueDate
    }
    
//    func taskIsCompleted() -> Bool {
//        guard let _ = {
//    }
    
}
