//
//  ViewController.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 04.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit
import MessageUI
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let tableData=RezeptData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
        cell.speciaLImg.image=UIImage(named: "\(rezept.bild)")
        
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let mailAction=UITableViewRowAction(style: .default, title: "Mail") { (action:UITableViewRowAction, indexPath:IndexPath) in
            
            let rezept=self.tableData.rezepte[indexPath.section][indexPath.row]
            let composeView=MFMailComposeViewController()
            composeView.mailComposeDelegate=self
            composeView.setToRecipients(["lidan1811@gmail.com"])
            composeView.setSubject("Hi From LiDan")
            composeView.setMessageBody("Hi lidan,\nHier ist mein \(rezept.title) Rezept\nMit Folgenden Rezept Zutaten:\(rezept.zutaten)", isHTML: false)
            
            if MFMailComposeViewController.canSendMail(){
                self.present(composeView, animated: true, completion: nil)
            }else{
                let alert=UIAlertController(title: "Oh", message: "Mailversand nicht möglich\nMail services are not available", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        mailAction.backgroundColor=UIColor.red
        return [mailAction]
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
