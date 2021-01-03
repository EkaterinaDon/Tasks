//
//  SavedTasks.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import Foundation

final class SavedTasks {
    
    func getTasks(with deep: Int) -> [ToDo] {
        
        if deep <= 0 {
            return []
        }
        
        var tasks: [ToDo] = []
        
        let randomValue = Int.random(in: 3...7)
        
        for value in (0...randomValue) {
            
            let taskWithSubTasks: Bool = Int.random(in: 0...1) == 0            
            var task: ToDo
            
            if taskWithSubTasks {
                task = Task(name: "Task # \(value + 1)", counter: "\(value)")
                task.subTasks = getTasks(with: deep - 1)
            } else {
                task = SubTask(name: "Task # \(value + 1)")
            }
            
            tasks.append(task)
        }
        return tasks
    }
}
