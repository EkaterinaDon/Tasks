//
//  FirstViewController.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tasks") as? TasksTableViewController {
            vc.firstScreen = true
            navigationController?.show(vc, sender: nil)
        }
    }

}
