//
//  TasksTableViewCell.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

 
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
