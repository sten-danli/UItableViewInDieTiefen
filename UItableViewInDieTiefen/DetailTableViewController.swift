//
//  DetailTableViewController.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 07.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var editToggle: UIBarButtonItem!
    var detailRezeptData:RezeptModle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func editTapped(_ sender: Any) {
        self.isEditing = !isEditing
        if isEditing{
            editToggle.title="Done"
        }else{
            editToggle.title="Edit"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //Todo
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return detailRezeptData.zutaten.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text=detailRezeptData.zutaten[indexPath.row]

        return cell
    }
}
