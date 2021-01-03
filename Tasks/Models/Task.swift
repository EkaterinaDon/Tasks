//
//  Task.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import Foundation

final class Task: ToDo {
    
    var subTasks: [ToDo] = []
    var name: String
    var counter: String
    
    init(name: String, counter: String) {
        self.name = name
        self.counter = "\(subTasks.count) subtasks"
    }

}

