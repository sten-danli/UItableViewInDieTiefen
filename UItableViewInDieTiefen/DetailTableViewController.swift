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
    
//    zutaten hinzufügen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInsertNewSegue"{
            let dvc=segue.destination as! EditingViewController
            dvc.saveDelegate={
                (newEntry) in
                
                self.detailRezeptData.zutaten.append(newEntry)
                self.navigationController?.popViewController(animated: true)
                self.tableView.reloadData()
            }
        }
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
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //Reihenfolge im attribut
        //xyz speichern/verändern
    }
    
    
    
//
//
//    einträge löschen
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            detailRezeptData.zutaten.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return detailRezeptData.zutaten.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text=detailRezeptData.zutaten[indexPath.row]

        return cell
    }
    
}
