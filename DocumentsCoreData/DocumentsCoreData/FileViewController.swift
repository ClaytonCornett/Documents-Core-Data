//
//  FileViewController.swift
//  DocumentsCoreData
//
//  Created by Clayton Cornett on 9/20/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var document = Document.self
    
    var documents = [Document]()
    let dateformatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Documents"
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .medium
    }
    
    @IBAction func saveFile(_ sender: Any) {
        
        let name = nameTextField.text
        let content = contentTextField.text
        
        //if(document == nil){
            Document(name: name, text: content)
        //}
       // else{
            //document.modify(name: name, text: content)
            // does not work for some reason
        //}
    }
    @IBOutlet weak var titleOutlet: UINavigationItem!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //fetchDocuments()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
