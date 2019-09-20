//
//  Document+CoreDataClass.swift
//  DocumentsCoreData
//
//  Created by Clayton Cornett on 9/20/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {

    
    var date: Date? {
        get{
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, text: String?) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        
        self.init(entity: Document.entity(), insertInto: managedContext)
        
        self.name = name
        self.text = text
        if let fileSize = text?.count {
            self.fileSize = Int64(fileSize)
        }
        self.date = Date(timeIntervalSinceNow: 0)
    

    }
    
    func modify(name: String, text: String?){
        self.name = name
        self.text = text
        if let fileSize = text?.count {
            self.fileSize = Int64(fileSize)
        }
        self.date = Date(timeIntervalSinceNow: 0)
    }
}



