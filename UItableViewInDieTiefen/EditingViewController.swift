//
//  EditingViewController.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 15.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class EditingViewController: UIViewController {
    
    var saveDelegate:((String)->())?
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let newEntry=textField.text
        if saveDelegate != nil{
            saveDelegate!(newEntry!)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
