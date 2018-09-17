//
//  DetailTableViewController.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 07.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var detailRezeptData:RezeptModle!
    var zutaten=[String]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var editToggle: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let okRezept=detailRezeptData{
            self.title = okRezept.title
            self.zutaten=okRezept.zutaten
        }

    }
    
//    zutaten hinzufügen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInsertNewSegue"{
            let dvc=segue.destination as! EditingViewController
            dvc.saveDelegate={
                (newEntry) in
                
                self.zutaten.append(newEntry)
                self.navigationController?.popViewController(animated: true)
                
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
          zutaten.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return zutaten.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        cell.textLabel?.text=zutaten[indexPath.row]

        return cell
    }
    
}
