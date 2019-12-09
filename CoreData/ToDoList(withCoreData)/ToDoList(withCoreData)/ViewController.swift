//
//  ViewController.swift
//  ToDoList(withCoreData)
//
//  Created by Egor Tereshonok on 12/9/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoItems = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: " Шо желаете робиц", message: "m?" , preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            let textField = ac.textFields?[0]
            self.toDoItems.insert((textField?.text)!, at: 0)
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addTextField {
            textFied in
        }
        
        ac.addAction(ok)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

// MARK: Table View Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoItems[indexPath.row]
        return cell
    }
    
    
}

