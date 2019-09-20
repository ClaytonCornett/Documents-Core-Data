//
//  TableViewController.swift
//  DocumentsCoreData
//
//  Created by Clayton Cornett on 9/20/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    @IBOutlet var documentTableView: UITableView!
    
    var documents = [Document]()
    let dateformatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Documents"
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDocuments()
        //documentTableView.reloadData()
        
    }
    
    @IBOutlet weak var cell: DocumentTableViewCell!
  
    func deleteFile(at indexPath: IndexPath){
    
        let file = documents[indexPath.row]
        
        if let managedContext = file.managedObjectContext{
            managedContext.delete(file)
            
            do {
                try managedContext.save()
                
                self.documents.remove(at: indexPath.row)
                
                documentTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("didnt work")
                
                documentTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        
    }

    func fetchDocuments() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Document> = Document.fetchRequest()
        
        do{
            documents = try (managedContext?.fetch(fetchRequest))!
            //documentTableView.reloadData()
        } catch {
            print("did not work")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return documents.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let protoCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if let protoCell = protoCell as? DocumentTableViewCell {
            let document = documents[indexPath.row]
            
            protoCell.nameLabel.text = document.name
            protoCell.filesizeLabel.text = String(document.fileSize) + " bytes"
            protoCell.dateLabel.text = dateformatter.string(from: document.date!)
        }
        return protoCell!
    }
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destination = segue.destination as? FileViewController,
            let selectedRow = self.documentTableView.indexPathForSelectedRow?.row else {
            //destination.document = documents[selectedRow]
                return
        }
        
       return
    }
 */ // does not work for some reason
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteFile(at: indexPath)
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
