//
//  ViewController.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 04.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let tableData=RezeptData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData.getSection(section: section)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.rezepte.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.rezepte[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SpecialTableViewCell
        let rezept=tableData.rezepte[indexPath.section][indexPath.row]
        cell.SpecialTitleLabel.text=rezept.title
        let counter=rezept.zutaten.count
        cell.SpecialContentCountLabel.text="\(counter) Zutaten"
        
        //cell.textLabel?.text=rezept.title
        return cell
        /*
        cell.SpecialTitleLabel.text=tableData[rezept]
        cell.SpecialContentCountLabel.text=tableData[rezept.zutaten.count]
 */
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            
            let indexPath=sender as! IndexPath
            let rezept=tableData.rezepte[indexPath.section][indexPath.row]
            let dvc=segue.destination as! DetailTableViewController
            dvc.detailRezeptData=rezept
            
            /*也可以写成这样
             if let indexPath=tableView.indexPathForSelectedRow{
             let rezept=tableData.rezepte[indexPath.section][indexPath.row]
             let dvc=segue.destination as! DetailTableViewController
             dvc.detailRezeptData=rezept
             */
 
            /*或是这样
             let indexPath=tableView.indexPathForSelectedRow
             let selectedRow=indexPath?.row
             let rezept=tableData.rezepte[selectedRow!]
             let dvc=segue.destination as! DetailTableViewController
             dvc.detailRezeptData=rezept[selectedRow!]
            */
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailView", sender: indexPath)
    }
}
