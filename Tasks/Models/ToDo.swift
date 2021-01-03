//
//  ToDo.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import Foundation

protocol ToDo {
    var name: String { get set }
    var subTasks: [ToDo] { get set }
}
