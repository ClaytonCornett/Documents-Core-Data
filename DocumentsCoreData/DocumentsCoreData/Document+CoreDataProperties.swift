//
//  Document+CoreDataProperties.swift
//  DocumentsCoreData
//
//  Created by Clayton Cornett on 9/20/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var text: String?
    @NSManaged public var fileSize: Int64
    @NSManaged public var rawDate: NSDate?

}
