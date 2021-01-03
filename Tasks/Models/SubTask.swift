//
//  SubTask.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import Foundation

final class SubTask: ToDo {
    var name: String
    var subTasks: [ToDo] = []
    
    init(name: String) {
        self.name = name
    }
}
