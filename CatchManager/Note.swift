//
//  Note.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 06.04.23.
//

import CoreData

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var id: NSNumber!
    @NSManaged var name: String!
    @NSManaged var price: String!
}
