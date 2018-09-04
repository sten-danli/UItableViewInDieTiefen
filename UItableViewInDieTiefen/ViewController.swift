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
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.rezepte.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.rezepte[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let rezept=tableData.rezepte[indexPath.section][indexPath.row]
        cell.textLabel?.text=rezept.title
        
        return cell
    }
}
